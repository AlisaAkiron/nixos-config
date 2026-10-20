{ ... }:

{
  imports = [
    ../options/wailord-nixos-options.nix

    ./profiles/cloud-server.nix

    ./modules/docker.nix
  ];

  virtualisation.docker.storageDriver = "overlay2";

  # use firewall provided by cloud provider
  networking.firewall.enable = false;

  # use Cloudflare DNS instead of the resolvers handed out by DHCP
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
  ];
  networking.networkmanager = {
    dns = "none";
    unmanaged = [ "tailscale0" ];
  };

  # pgadmin's ssh key
  users.users.alisa.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICNXiJoAalVVCuK/1psQiKN4NNIHndYApBHqkYIHhVqq pgadmin"
  ];
}
