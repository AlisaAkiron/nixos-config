{ inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.default

    ../../core/galaxy-wsl2-core.nix
    ../../home/galaxy-wsl2-home.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "alisa";

  wsl.wslConf.network.hostname = "galaxy";

  networking.hostName = "galaxy";
  system.stateVersion = "24.05";
}
