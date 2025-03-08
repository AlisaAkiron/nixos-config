{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager

    ./terminal/emulator/ghostty-darwin.nix
  ];

  nixpkgs.overlays = [
    inputs.morlana.overlays.default
  ];

  home-manager.users.alisa = {
    imports = [
      ../options/mbp-darwin-options.nix

      # Dev Env
      ./devenv

      # Terminal
      ./terminal/profile-desktop.nix

      ./terminal/ssh/1password.nix
      ./terminal/ssh/public-server.nix

      ./terminal/multiplexer/tmux

      ./terminal/extra/zsh/fnm.nix
      ./terminal/extra/zsh/dotnet.nix
      ./terminal/extra/zsh/proxy.nix

      # Editor
      ./editors/neovim
    ];

    home.packages = with pkgs; [
      morlana # nh like tool for darwin
      fnm # Node.js version manager
      jdk # Java Development Kit
      lua # Lua programming language
      micromamba # Conda package manager
      bun # Bun JS/TS runtime
    ];

    home.sessionPath = [
      "/usr/local/share/dotnet" # .NET SDK (local install)
      "/Users/alisa/.dotnet/tools" # .NET Tools
      "/Users/alisa/Library/Application Support/JetBrains/Toolbox/scripts" # JetBrains Toolbox
    ];

    programs.zsh = {
      initExtra = ''
        # Homebrew
        eval "$(/opt/homebrew/bin/brew shellenv)"
      '';
      shellAliases = {
        quarantine-permit = "sudo xattr -r -d com.apple.quarantine";
      };
    };
  };
}
