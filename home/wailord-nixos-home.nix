{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      ../options/wailord-nixos-options.nix

      ./profiles/server.nix
    ];
  };
}
