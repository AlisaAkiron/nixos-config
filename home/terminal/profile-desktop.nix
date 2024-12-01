{ ... }:

{
  imports = [
    ./emulator/wezterm.nix

    ./programs

    ./shell/starship.nix
    ./shell/zsh.nix
  ];
}
