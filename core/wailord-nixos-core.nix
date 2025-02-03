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

  # pgadmin's ssh key
  users.users.alisa.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICNXiJoAalVVCuK/1psQiKN4NNIHndYApBHqkYIHhVqq pgadmin"
  ];
}
