{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/neptune-nixos.nix
  ];

  networking.hostName = "neptune";
  system.stateVersion = "24.11";
}
