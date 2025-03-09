{ pkgs, lib, ... }:

let
  isNotDarwin = !pkgs.stdenvNoCC.isDarwin;
in
{

  home.packages = lib.mkIf isNotDarwin [
    pkgs.ghostty
  ];

  xdg.configFile."ghostty/config".text = ''
    font-family = "Maple Mono NF"
    font-size = 16
    theme = dark:catppuccin-mocha,light:catppuccin-latte
    window-padding-balance = true
    window-padding-color = background
    cursor-style = bar
    cursor-style-blink = true
    shell-integration-features = no-cursor
  '';
}
