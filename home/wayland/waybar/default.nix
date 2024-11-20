{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  xdg.configFile."waybar/config" = {
    source = ./config/config.json;
  };

  xdg.configFile."waybar/style.css" = {
    source = ./config/style.css;
  };
}
