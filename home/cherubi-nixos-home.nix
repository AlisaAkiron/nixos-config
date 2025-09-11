{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      ../options/cherubi-nixos-options.nix

      ./profiles/server.nix
    ];
  };

  home-manager.users.chingc = {
    imports = [
      ../options/cherubi-nixos-options.nix

      ./profiles/server.nix
    ];
  };
}
