{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      # Developer
      ./developer/dotnet

      # Dev Env
      ./devenv

      # Terminal
      ./terminal/profile-tty.nix
      
      ./terminal/ssh/1password.nix
      ./terminal/ssh/public-server.nix
    ];

    programs.zsh = {
      initExtra = ''
        # Homebrew
        eval "$(/opt/homebrew/bin/brew shellenv)"

        # JENV
        export PATH="$HOME/.jenv/bin:$PATH"
        eval "$(jenv init -)"

        # Add .NET Core SDK tools 
        export PATH="$PATH:/Users/alisa/.dotnet/tools"

        # NodeJS Version Manager
        export NVM_DIR="$HOME/.nvm"
        [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
        [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

        # Python packages
        export PATH="$PATH:/Users/alisa/Library/Python/3.11/bin"

        # PNPM
        export PNPM_HOME="/Users/alisa/Library/pnpm"
        export PATH="$PNPM_HOME:$PATH"

        # Added by Toolbox App
        export PATH="$PATH:/Users/alisa/Library/Application Support/JetBrains/Toolbox/scripts"

        # Add 1Password SSH Agent
        export SSH_AUTH_SOCK="/Users/alisa/.1password/agent.sock"
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
