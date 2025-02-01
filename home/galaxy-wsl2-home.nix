{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      # Catppuccin Theme
      inputs.catppuccin.homeManagerModules.catppuccin

      # Editor
      ./editors/neovim

      # Developer
      ./developer/common.nix
      ./developer/dotnet

      # Terminal
      ./terminal/profile-tty.nix
    ];

    catppuccin = {
      accent = "pink";
      flavor = "mocha";
    };

    home.packages = [
      (import ../packages/dfx { inherit pkgs; })
    ];

    programs.git.signing.gpgPath = "/mnt/d/Developer/GnuPG/bin/gpg.exe";
  };
}
