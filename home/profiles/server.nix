{ ... }:

{
  imports = [
    # Editors
    ../editors/neovim

    # Terminal
    ../terminal/profile-tty.nix
    ../terminal/extra/zsh/zellij.nix
  ];
}
