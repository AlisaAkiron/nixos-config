{
  lib,
  pkgs,
  config,
  ...
}:

let
  darkModeConfig = {
    gtk-application-prefer-dark-theme = 1;
  };
in
{
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;

    font = {
      name = "Noto Sans CJK SC";
      size = 9;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    gtk3.extraConfig = darkModeConfig;
    gtk4.extraConfig = darkModeConfig;
  };

  xdg.configFile."gtk-4.0/gtk.css".enable = lib.mkForce false;

  home.sessionVariables.GTK_THEME = config.gtk.theme.name;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
