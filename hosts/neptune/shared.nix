{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../core/neptune-vm-nixos.core.nix
    ../../home/neptune-vm-nixos-home.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
}
