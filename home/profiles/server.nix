{ ... }:

{
  imports = [
    # Editors
    ../editors/neovim

    # Terminal
    ../terminal/profile-tty.nix

    # Tmux
    ../terminal/programs/tmux.nix
  ];
}
