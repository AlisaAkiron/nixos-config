{ pkgs, ... }:

{
  imports = [
    ../options/cherubi-nixos-options.nix

    ./profiles/server.nix

    ./modules/docker.nix
  ];

  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.docker.daemon.settings.registry-mirrors = [
    "https://harbor.maa-org.net/docker"
  ];

  # use port forward on router
  networking.firewall.enable = false;

  environment.systemPackages = with pkgs; [
    lvm2
  ];
}
