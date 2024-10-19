{ inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];

  system.stateVersion = "24.11";

  wsl.enable = true;
  wsl.defaultUser = "alisa";

  wsl.wslConf.network.hostname = "galaxy";
  networking.hostName = "galaxy";
}
