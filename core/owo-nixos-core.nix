{ ... }:

{
  imports = [
    ../options/owo-nixos-options.nix

    ./profiles/server.nix

    ./modules/docker.nix
  ];

  virtualisation.docker.storageDriver = "btrfs";
  networking.firewall.enable = false;
}
