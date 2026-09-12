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
    "/home/alisa/.dotnet/tools" # .NET Tools
  ];

  programs.zsh = {
    initContent = ''
      # Named directories
      hash -d dl="$HOME/Downloads"
      hash -d dt="$HOME/Desktop"
      hash -d dev="$HOME/Developer"
      hash -d prog="$HOME/Developer/Programs"
      hash -d work="$HOME/Developer/Workspace"
    '';
  };
}
