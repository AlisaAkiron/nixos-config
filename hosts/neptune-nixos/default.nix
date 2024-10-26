{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../core/neptune-nixos-core.nix
    ../../home/neptune-nixos-home.nix
  ];

  networking.hostName = "neptune";
  system.stateVersion = "24.11";
}
