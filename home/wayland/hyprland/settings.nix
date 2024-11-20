{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "hyprpaper"
      "fcitx5 -d -r"
      "fcitx5-remote -r"
    ];

    input = {
      kb_layout = "us";
      follow_mouse = true;
      numlock_by_default = true;
    };

    general = {
      layout = "dwindle";
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;
      allow_tearing = true;
      resize_on_border = true;

      "col.active_border" = "rgba(88888888)";
      "col.inactive_border" = "rgba(00000088)";
    };

    decoration = {
      rounding = 16;
      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 1.0e-2;
        vibrancy = 0.2;
        vibrancy_darkness = 0.5;
        passes = 4;
        size = 7;
        popups = true;
        popups_ignorealpha = 0.2;
      };

      shadow = {
        enabled = true;
        color = "rgba(00000055)";
        ignore_window = true;
        offset = "0 15";
        range = 100;
        render_power = 2;
        scale = 0.97;
      };
    };

    animations = {
      enabled = true;
      animation = [
        "border, 1, 2, default"
        "fade, 1, 4, default"
        "windows, 1, 10, default, popin 80%"
        "workspaces, 1, 2, default, slide"
      ];
    };

    dwindle = {
      # keep floating dimentions while tiling
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      disable_autoreload = true;
      animate_mouse_windowdragging = false;
      vrr = 1;
    };
  };
}
