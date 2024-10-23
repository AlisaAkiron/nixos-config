{ inputs, ... }:

{
  imports = [
    # Home Manager 
    inputs.home-manager.nixosModules.home-manager

    # Core Modules
    ./core/bootloader.nix
    ./core/fonts.nix
    ./core/gnome.nix
    ./core/networkmanager.nix
    ./core/pipewire.nix
    ./core/programs.nix
    ./core/security.nix
    ./core/services.nix
    ./core/system.nix
    ./core/user.nix
  ];

  home-manager.users.alisa.imports = [
    ./home/git.nix
    ./home/zsh.nix
  ];
}
