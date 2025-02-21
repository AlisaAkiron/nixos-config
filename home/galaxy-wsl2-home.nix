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
      ./developer/dotnet

      # Terminal
      ./terminal/profile-tty.nix

      ./terminal/extra/zsh/fnm.nix
      ./terminal/extra/zsh/dotnet.nix
      ./terminal/extra/zsh/proxy.nix
      ./terminal/extra/zsh/zellij.nix
    ];

    home.packages = with pkgs; [
      fnm # Node.js version manager
      jdk # Java Development Kit
      lua # Lua programming language
      micromamba # Conda package manager
    ];

    programs.git.signing.gpgPath = "/mnt/d/Scoop/Scoop Apps/apps/gpg4win/current/GnuPG/bin/gpg.exe";
  };
}
