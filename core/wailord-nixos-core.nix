{ ... }:

{
  imports = [
    ../options/wailord-nixos-options.nix

    ./profiles/server.nix

    ./modules/docker.nix
  ];

  virtualisation.docker.storageDriver = "overlay2";
}
