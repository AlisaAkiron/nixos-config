{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      ../options/neptune-vm-nixos-options.nix

      ./profiles/server.nix
    ];
  };
}
