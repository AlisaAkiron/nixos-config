{ ... }:

{
  imports = [
    ../options/owo-nixos-options.nix

    ./profiles/homelab-server.nix
  ];

  virtualisation.docker.storageDriver = "btrfs";
}
