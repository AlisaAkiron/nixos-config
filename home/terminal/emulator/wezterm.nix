{ pkgs, lib, ... }:

let
  isNotDarwin = !pkgs.stdenvNoCC.isDarwin;
  weztermPackage = if isNotDarwin
    then pkgs.wezterm
    else (import ../../../packages/placeholder { inherit pkgs; });
in
{
  programs.wezterm = {
    enable = true;
    package = weztermPackage;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraConfig = ''
      local wezterm = require("wezterm")

      local config = wezterm.config_builder()

      config.color_scheme = "Catppuccin Mocha"

      config.font = wezterm.font("CaskaydiaCove Nerd Font")
      config.font_size = 13.0
      config.line_height = 1.2

      config.enable_tab_bar = false

      config.window_decorations = "TITLE | RESIZE"
      config.window_background_opacity = 0.75
      config.macos_window_background_blur = 10

      return config
    '';
  };
}
