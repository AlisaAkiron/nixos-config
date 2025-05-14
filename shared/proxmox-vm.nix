{ inputs, ... }:

{
  import = [
    ../core/profiles/server.nix
    ../core/modules/docker.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  virtualisation.docker.storageDriver = "btrfs";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  home-manager.users.alisa = {
    imports = [
      ../home/profiles/server.nix
    ];
  };
}
