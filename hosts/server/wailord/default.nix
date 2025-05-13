{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../core/wailord-nixos-core.nix
    ../../home/wailord-nixos-home.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";

  networking.usePredictableInterfaceNames = false;

  boot.kernelParams = [
    "console=ttyS0,115200n8"
    "console=tty0"
  ];

  networking.hostName = "wailord";
  system.stateVersion = "25.05";
}
