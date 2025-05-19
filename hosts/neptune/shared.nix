{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../options/neptune-vm-nixos-options.nix

    ../../core/profiles/server.nix
    ../../core/modules/docker.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.docker.autoPrune = {
    enable = true;
    dates = "weekly";
    flags = [
      "--all"
    ];
  };
  virtualisation.docker.daemon.settings = {
    "registry-mirrors" = [
      "https://oci.alisaqaq.moe"
    ];
    "metrics-addr" = "0.0.0.0:9323";
  };

  home-manager.users.alisa = {
    imports = [
      ../../options/neptune-vm-nixos-options.nix

      ../../home/profiles/server.nix
    ];
  };
}
