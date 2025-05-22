{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../../core/owo-nixos-core.nix
    ../../../home/owo-nixos-home.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  networking.hostName = "owo";
  system.stateVersion = "25.05";
}
