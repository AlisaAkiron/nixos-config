{ ... }:

{
  imports = [
    ./programs
    ./programs/tmux.nix

    ./shell/starship.nix
    ./shell/zsh.nix
  ];
}
