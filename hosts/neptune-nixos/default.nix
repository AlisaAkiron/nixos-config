{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../core/neptune-nixos-core.nix
    ../../home/neptune-nixos-home.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  networking.hostName = "neptune";
  system.stateVersion = "25.05";
}
