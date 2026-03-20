{ ... }:

{
  imports = [
    ./emulator/ghostty.nix

    ./programs
    ./programs/tmux.nix

    ./shell/starship.nix
    ./shell/zsh.nix
  ];
}
