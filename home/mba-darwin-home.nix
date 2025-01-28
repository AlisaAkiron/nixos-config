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
      # Catppuccin Theme
      inputs.catppuccin.homeManagerModules.catppuccin

      # Developer
      ./developer/common.nix

      # Dev Env
      ./devenv

      # Terminal
      ./terminal/profile-desktop.nix

      ./terminal/ssh/1password.nix
      ./terminal/ssh/public-server.nix

      # Editor
      ./editors/neovim
    ];

    home.packages = [
      (import ../packages/dfx { inherit pkgs; })
      pkgs.morlana
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
        cdp = "cd ~/Developer/Program";
        cdc = "cd ~/Developer/Container";
        cdw = "cd ~/Developer/Work";
        quarantine-permit = "sudo xattr -r -d com.apple.quarantine";
      };
    };
  };
}
