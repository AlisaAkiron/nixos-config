{ pkgs, lib, ... }:

let
  isNotDarwin = !pkgs.stdenvNoCC.isDarwin;
in
{

  home.packages = lib.mkIf isNotDarwin [
    pkgs.ghostty
  ];

  xdg.configFile."ghostty/config".text = ''
    font-family = "Maple Mono NF CN"
    font-size = 16
    theme = dark:Catppuccin Mocha,light:Catppuccin Latte
    window-padding-balance = true
    window-padding-color = background
    cursor-style = bar
    cursor-style-blink = true
    shell-integration-features = no-cursor
  '';
}
