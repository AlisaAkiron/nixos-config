{ pkgs, ... }:

{
  system.nixos.tags = [ "Gnome" ];

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    excludePackages = [ pkgs.xterm ];
  };

  environment.gnome.excludePackages = (
    with pkgs;
    [
      gnome-photos
      gnome-tour
      gnome-text-editor
      gnome-calculator
      gnome-music
      gnome-characters
      gnome-contacts
      gnome-maps
      gedit
      cheese # webcam
      epiphany # browser
      geary # email
      evince # document viewer
      totem # video player
      simple-scan # document scaner
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
    ]
  );

  users.users.gdm.extraGroups = [
    "gdm"
    "video"
  ];
}
