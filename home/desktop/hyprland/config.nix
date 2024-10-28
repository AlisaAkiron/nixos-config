{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "hyprpaper"
    ];

    input = {
      kb_layout = "us";
      numlock_by_default = true;
    };

    general = {
      layout = "dwindle";
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      border_part_of_window = false;
      no_border_on_floating = false;
    };

    "$mainMod" = "SUPER";

    bind = [
      # Help
      "$mainMod, F1, exec, show-keybinds"

      # Open some program
      "ALT, Space, exec, rofi -show drun || pkill rofi"
      "$mainMod, T, exec, kitty"
      "$mainMod, Q, killactive"
    ];
  };
}
