{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      # Dev Env
      ./devenv

      # Terminal
      ./terminal/profile-tty.nix

      ./terminal/ssh/1password.nix
      ./terminal/ssh/public-server.nix

      # Editor
      ./editors/neovim
    ];

    home.packages = [
      (import ../packages/dfx { inherit pkgs; })
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

        # JENV
        export PATH="$HOME/.jenv/bin:$PATH"
        eval "$(jenv init -)"

        # NodeJS Version Manager
        export NVM_DIR="$HOME/.nvm"
        [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
        [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

        # PNPM
        export PNPM_HOME="/Users/alisa/Library/pnpm"
        export PATH="$PNPM_HOME:$PATH"
      '';
      shellAliases = {
        cdp = "cd ~/Developer/Program";
        cdc = "cd ~/Developer/Container";
        cdw = "cd ~/Developer/Work";
        quarantine-permit = "sudo xattr -r -d com.apple.quarantine";
      };
    };
  };
}
