{ ... }:

{
  imports = [
    ../options/galaxy-home-options.nix

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

    # Extra
    ./terminal/extra/github/gh.nix
    ./terminal/extra/zsh/1password-cli.nix
    ./terminal/extra/zsh/esp-idf.nix
  ];

  home.sessionPath = [
    "/home/alisa/.local/bin"
    "/home/alisa/.cargo/bin" # Rust / Cargo
    "/home/alisa/.local/share/go/bin" # Go binaries (GOPATH=$HOME/.local/share/go)
    "/home/alisa/.dotnet" # .NET SDK installed by the official installer
    "/home/alisa/.dotnet/tools" # .NET Tools
    "/home/alisa/.local/share/pnpm/bin" # pnpm
  ];

  programs.zsh = {
    initContent = ''
      # Named directories
      hash -d dl="$HOME/Downloads"
      hash -d dt="$HOME/Desktop"
      hash -d dev="$HOME/Developer"
      hash -d prog="$HOME/Developer/Programs"
      hash -d work="$HOME/Developer/Workspace"

      # pnpm
      export PNPM_HOME='/home/alisa/.local/share/pnpm'
    '';
  };
}
