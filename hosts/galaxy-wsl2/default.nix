{ inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.default

    ../../modules/galaxy-wsl2.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "alisa";

  wsl.wslConf.network.hostname = "galaxy";

  networking.hostName = "galaxy";
  system.stateVersion = "24.05";
}
