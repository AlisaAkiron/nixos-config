{ ... }:

{
  imports = [
    ./hyprland
    ./waybar

    ./hyprpaper.nix
    ./rofi.nix
    ./wlogout.nix
  ];

  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland";
  };
}
