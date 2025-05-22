{ inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.default

    ../../../core/galaxy-wsl2-core.nix
    ../../../home/galaxy-wsl2-home.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "alisa";

  wsl.wslConf.network.hostname = "galaxy";

  wsl.docker-desktop.enable = true;
  wsl.startMenuLaunchers = true;

  networking.hostName = "galaxy";
  system.stateVersion = "25.05";
}
