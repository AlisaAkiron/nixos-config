{ ... }:

{
  imports = [
    ../options/neptune-vm-nixos-options.nix

    ./profiles/homelab-server.nix
  ];

  virtualisation.docker.storageDriver = "btrfs";
}
