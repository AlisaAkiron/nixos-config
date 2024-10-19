{ inputs, ... }:

home-config: [
  inputs.home-manager.nixosModules.home-manager
  {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = false;
    home-manager.extraSpecialArgs = {
      inherit inputs;
    };

    home-manager.users.alisa = home-config;
  }
]
