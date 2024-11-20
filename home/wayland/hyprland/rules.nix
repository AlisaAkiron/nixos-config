{ lib, ... }:

{
  wayland.windowManager.hyprland.settings = {

    # layer rules
    layerrule =
      let
        toRegex =
          list:
          let
            elements = lib.concatStringsSep "|" list;
          in
          "^(${elements})$";

        lowopacity = [
          "bar"
          "calendar"
          "notifications"
          "system-menu"
        ];

        highopacity = [
          "anyrun"
          "osd"
          "logout_dialog"
        ];

        blurred = lib.concatLists [
          lowopacity
          highopacity
        ];
      in
      [
        "blur, ${toRegex blurred}"
        "xray 1, ${toRegex [ "bar" ]}"
        "ignorealpha 0.5, ${toRegex (highopacity ++ [ "music" ])}"
        "ignorealpha 0.2, ${toRegex lowopacity}"
      ];

    windowrulev2 = [
      # fcitx5
      "pseudo, class:(fcitx)"

      # fix xwayland apps
      "rounding 0, xwayland:1"
      "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
      "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"
    ];
  };
}
