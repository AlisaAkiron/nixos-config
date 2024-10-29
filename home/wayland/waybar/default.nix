{ pkgs, ... }:

{
  imports = [
    ./settings.nix
  ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };
}
