{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      ../options/galaxy-wsl2-options.nix

      # Editor
      ./editors/neovim

      # Developer
      ./developer/common.nix
      ./developer/dotnet

      # Terminal
      ./terminal/profile-tty.nix
    ];

    home.packages = [
      (import ../packages/dfx { inherit pkgs; })
    ];

    programs.git.signing.gpgPath = "/mnt/d/Developer/GnuPG/bin/gpg.exe";
  };
}
