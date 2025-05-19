{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../options/neptune-vm-nixos-options.nix

    ../../core/profiles/server.nix
    ../../core/modules/docker

    inputs.home-manager.nixosModules.home-manager
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  virtualisation.docker.storageDriver = "btrfs";

  home-manager.users.alisa = {
    imports = [
      ../../options/neptune-vm-nixos-options.nix

      ../../home/profiles/server.nix
    ];
  };
}
