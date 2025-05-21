{ pkgs, ... }:

{
  imports = [
    ../options/cherubi-nixos-options.nix

    ./profiles/cloud-server.nix

    ./modules/docker.nix
  ];

  virtualisation.docker.storageDriver = "btrfs";

  # use port forward on router
  networking.firewall.enable = false;

  environment.systemPackages = with pkgs; [
    lvm2
  ];
}
