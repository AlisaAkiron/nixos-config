{ ... }:

{
  imports = [
    ../options/galaxy-wsl2-options.nix

    ./common
    ./software

    ./extra/nix-proxy.nix
  ];

  environment.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
  };
}
