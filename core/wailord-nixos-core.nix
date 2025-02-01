{ ... }:

{
  imports = [
    ./common
    ./nixos
    ./software

    ./modules/docker.nix
  ];

  bootloader.type = "grub";
  bootloader.grub.device = "/dev/vda";

  virtualisation.docker.storageDriver = "overlay2";

  environment.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
  };
}
