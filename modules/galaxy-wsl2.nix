{ inputs, ... }:

{
  imports = [
    # Home Manager 
    inputs.home-manager.nixosModules.home-manager

    # Core Modules
    ./core/programs.nix
    ./core/user.nix
    ./core/security.nix
    ./core/system.nix
  ];

  home-manager.users.alisa.imports = [
    ./home
  ];
}
