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

      ./darwin

      # Dev Env
      ./devenv
      ./developer

      ./developer/python

      # Terminal
      ./terminal/profile-desktop.nix

      ./terminal/ssh/1password.nix
      ./terminal/ssh/public-server.nix

      # Editor
      ./editors/neovim
    ];

    home.packages = with pkgs; [
      morlana # nh like tool for darwin
    ];

    home.sessionPath = [
      "/usr/local/share/dotnet" # .NET SDK (local install)
      "/Users/alisa/.dotnet/tools" # .NET Tools
      "/Users/alisa/Library/Application Support/JetBrains/Toolbox/scripts" # JetBrains Toolbox
    ];

    developer = {
      kubernetes = true;
      web = true;
      lua = true;
      dotnet = false; # Use manual install
    };

    programs.zsh = {
      initContent = ''
        # Homebrew
        eval "$(/opt/homebrew/bin/brew shellenv)"

        # JEnv
        export PATH="$HOME/.jenv/bin:$PATH"
        eval "$(jenv init -)"
      '';
      shellAliases = {
        quarantine-permit = "sudo xattr -r -d com.apple.quarantine";
      };
    };
  };
}
