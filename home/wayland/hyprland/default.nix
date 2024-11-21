{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./settings.nix
    ./binds.nix
    ./rules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };

    systemd = {
      enable = false;
      variables = [ "--all" ];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  systemd.user.targets.tray.Unit.Requires = lib.mkForce [ "graphical-session.target" ];
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

  home.packages = with pkgs; [
    hyprls
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    kitty
    wayland
    slurp
    grimblast
    wl-clipboard
    pavucontrol
    wlogout
  ];
}
