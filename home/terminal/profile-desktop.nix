{ ... }:

{
  imports = [
    ./emulator/ghostty.nix

    ./programs

    ./shell/starship.nix
    ./shell/zsh.nix
  ];
}
