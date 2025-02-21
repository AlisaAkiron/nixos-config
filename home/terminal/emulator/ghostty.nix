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
    window-padding-color = background
    cursor-style = bar
    cursor-style-blink = true
    shell-integration-features = no-cursor

    # for zellij
    macos-option-as-alt = true
    keybind = cmd+t=unbind
    keybind = cmd+n=unbind
    keybind = cmd+c=unbind
    keybind = cmd+w=unbind
    keybind = alt+left=unbind
    keybind = alt+right=unbind
    keybind = cmd+opt+left=unbind
    keybind = cmd+opt+right=unbind
  '';
}
