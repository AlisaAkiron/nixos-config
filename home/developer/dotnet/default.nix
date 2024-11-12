{ pkgs, ... }:

let
  # This is needed to install workload in $HOME
  # https://discourse.nixos.org/t/dotnet-maui-workload/20370/2
  userlocal =  ''
      for i in $out/sdk/*; do
        i=$(basename $i)
        length=$(printf "%s" "$i" | wc -c)
        substring=$(printf "%s" "$i" | cut -c 1-$(expr $length - 2))
        i="$substring""00"
        mkdir -p $out/metadata/workloads/''${i/-*}
        touch $out/metadata/workloads/''${i/-*}/userlocal
      done
    '';

  # append userlocal sctipt to postInstall phase
  postInstallUserlocal = (finalAttrs: previousAttrs: {
    postInstall = (previousAttrs.postInstall or '''') + userlocal;
  });
  # append userlocal sctipt to postBuild phase
  postBuildUserlocal = (finalAttrs: previousAttrs: {
    postBuild = (previousAttrs.postBuild or '''') + userlocal;
  });

  dotnet-combined = (with pkgs.dotnetCorePackages;
      combinePackages [
        (sdk_8_0.overrideAttrs postInstallUserlocal)
        (sdk_9_0.overrideAttrs postInstallUserlocal)
      ]
    ).overrideAttrs postBuildUserlocal;
in
{
  home.sessionVariables = {
    DOTNET_ROOT = "${dotnet-combined}";
  };

  home.packages = [
    dotnet-combined
  ];
}

