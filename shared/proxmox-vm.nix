{ inputs, ... }:

{
  import = [
    ../core/profiles/server.nix
    ../core/modules/docker.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      ../home/profiles/server.nix
    ];
  };
}
