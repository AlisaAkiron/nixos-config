{ ... }:

{
  nixpkgs.overlays = [
    # kubernetes-helm 4.2.0 fails to build on Darwin: the Darwin-only preCheck
    # still patches test files under cmd/helm/, but Helm 4 moved them to pkg/cmd/.
    # Mirror the upstream fix by rewriting the paths in preCheck.
    # Remove once https://github.com/NixOS/nixpkgs/issues/532255 is fixed upstream.
    (final: prev: {
      kubernetes-helm = prev.kubernetes-helm.overrideAttrs (old: {
        preCheck = builtins.replaceStrings [
          "cmd/helm/dependency_build_test.go"
          "cmd/helm/dependency_update_test.go"
          "cmd/helm/install_test.go"
          "cmd/helm/pull_test.go"
        ] [
          "pkg/cmd/dependency_build_test.go"
          "pkg/cmd/dependency_update_test.go"
          "pkg/cmd/install_test.go"
          "pkg/cmd/pull_test.go"
        ] old.preCheck;
      });
    })
  ];
}
