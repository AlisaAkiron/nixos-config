{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      ../options/owo-nixos-options.nix

      ./profiles/server.nix
    ];
  };
}
