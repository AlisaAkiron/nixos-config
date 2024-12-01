{ ... }:

let
  workspaces = builtins.concatLists (
    builtins.genList (
      x:
      let
        ws =
          let
            c = (x + 1) / 10;
          in
          builtins.toString (x + 1 - (c * 10));
      in
      [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    ) 10
  );

  toggle =
    program:
    let
      prog = builtins.substring 0 14 program;
    in
    "pkill ${prog} || uwsm app -- ${program}";

  runOnce = program: "pgrep ${program} || uwsm app -- ${program}";
in
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    # mouse movements
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod ALT, mouse:272, resizewindow"
    ];

    bind = [
      # help
      "$mod, F1, exec, show-keybinds"

      # compositor commands
      "$mod SHIFT, E, exec, pkill Hyprland"
      "$mod, Q, killactive,"
      "$mod, F, fullscreen,"
      "$mod, T, exec, wezterm"

      # launchers
      "ALT, SPACE, exec, ${toggle "anyrun"}"

      # screenshot
      ## area
      "ALT, 4, exec, ${runOnce "grimblast"} --notify copysave area"

      ## current screen
      ", Print, exec, ${runOnce "grimblast"} --notify --cursor copysave output"
      "ALT, 5, exec, ${runOnce "grimblast"} --notify --cursor copysave output"

      ## all screens
      "ALT, Print, exec, ${runOnce "grimblast"} --notify --cursor copysave screen"
      "ALT, 6, exec, ${runOnce "grimblast"} --notify --cursor copysave screen"

      # move focus
      "$mod SHIFT, left, movefocus, l"
      "$mod SHIFT, right, movefocus, r"
      "$mod SHIFT, up, movefocus, u"
      "$mod SHIFT, down, movefocus, d"

      # window management
      "$mod ALT, left, swapwindow, l"
      "$mod ALT, right, swapwindow, r"
      "$mod ALT, up,swapwindow, u"
      "$mod ALT, down, swapwindow, d"

      # workspace navigation
      "$mod, left, workspace, -1"
      "$mod, right, workspace, +1"
      "$mod, mouse_down, workspace, -1"
      "$mod, mouse_up, workspace, +1"
      "$mod SHIFT, C, togglespecialworkspace"

      # cycle monitors
      "$mod SHIFT, bracketleft, focusmonitor, l"
      "$mod SHIFT, bracketright, focusmonitor, r"

      # send focused workspace to left/right monitors
      "$mod SHIFT ALT, bracketleft, movecurrentworkspacetomonitor, l"
      "$mod SHIFT ALT, bracketright, movecurrentworkspacetomonitor, r"

    ] ++ workspaces;
  };
}
