{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./data-disk.nix

    ../../core/cherubi-nixos-core.nix
    ../../home/cherubi-nixos-home.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  networking.hostName = "cherubi";
  system.stateVersion = "25.05";
}
