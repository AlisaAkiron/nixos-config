{ ... }:

{
  imports = [
    ../options/neptune-vm-nixos-options.nix

    ./profiles/server.nix

    ./modules/docker
  ];

  virtualisation.docker.storageDriver = "btrfs";
  networking.firewall.enable = false;
}
