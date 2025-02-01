{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    bootloader = {
      type = lib.mkOption {
        type = lib.types.enum [
          "systemd-boot"
          "grub"
        ];
        default = "systemd-boot";
        description = "Select which bootloader to use.";
      };
    };

    grub = {
      device = lib.mkOption {
        type = lib.types.string;
        default = "/dev/sda";
        description = "The device to install GRUB on.";
      };
    };
  };

  config = {
    boot.loader.systemd-boot = lib.mkIf (config.bootloader.type == "systemd-boot") {
      enable = true;
      configurationLimit = 10;
    };

    boot.loader.grub = lib.mkIf (config.bootloader.type == "grub") {
      enable = true;
      version = 2;
      device = config.bootloader.grub.device;
    };

    catppuccin.grub.enable = true;

    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
