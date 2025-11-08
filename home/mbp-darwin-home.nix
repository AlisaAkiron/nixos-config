{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager

    ./terminal/emulator/ghostty-darwin.nix
  ];

  home-manager.users.alisa = {
    imports = [
      ../options/mbp-darwin-options.nix

      ./darwin

      # Dev Env
      ./developer/cloud
      ./developer/embedded
      ./developer/kubernetes
      ./developer/web
      ./developer/lua
      ./developer/python

      # Terminal
      ./terminal/profile-desktop.nix

      ./terminal/ssh/1password.nix
      ./terminal/ssh/public-server.nix

      # Editor
      ./editors/neovim
    ];

    home.sessionPath = [
      "/usr/local/share/dotnet" # .NET SDK (local install)
      "/Users/alisa/.dotnet/tools" # .NET Tools
      "/Users/alisa/Library/Application Support/JetBrains/Toolbox/scripts" # JetBrains Toolbox
    ];

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
