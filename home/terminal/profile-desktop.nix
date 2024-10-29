{ ... }:

{
  imports = [
    ./emulator/kitty.nix

    ./programs

    ./shell/starship.nix
    ./shell/zsh.nix
  ];
}
