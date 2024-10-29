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

      drop_shadow = true;
      shadow_ignore_window = true;
      shadow_offset = "0 15";
      shadow_range = 100;
      shadow_render_power = 2;
      shadow_scale = 0.97;

      "col.shadow" = "rgba(00000055)";
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

    misc = {
      disable_autoreload = true;
      animate_mouse_windowdragging = false;
      vrr = 1;
    };

    windowrulev2 = [
      "pseudo, class:(fcitx)"
    ];

    "$mainMod" = "SUPER";

    bind = [
      # Help
      "$mainMod, F1, exec, show-keybinds"

      # Open some program
      "ALT, Space, exec, rofi -show drun || pkill rofi"
      "$mainMod, T, exec, kitty"
      "$mainMod, Q, killactive"
      "$mainMod, 4, exec, grimblast copy area"
    ];
  };
}
