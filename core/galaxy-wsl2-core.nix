{ ... }:

{
  imports = [
    ../options/galaxy-wsl2-options.nix

    ./common
    ./software
  ];

  environment.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
  };
}
