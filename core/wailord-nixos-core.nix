{ ... }:

{
  imports = [
    ../options/wailord-nixos-options.nix

    ./profiles/server.nix

    ./modules/docker.nix
  ];

  virtualisation.docker.storageDriver = "overlay2";

  # use firewall provided by cloud provider
  networking.firewall.enable = false;
}
