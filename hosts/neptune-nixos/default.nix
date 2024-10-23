{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "neptune";
  system.stateVersion = "24.05";
}
