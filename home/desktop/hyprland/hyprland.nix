{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    kitty
    wayland
    slurp
    pavucontrol
    wlogout
  ];
}
