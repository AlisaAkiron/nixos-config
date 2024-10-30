{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    glib
    gsettings-qt
    gsettings-desktop-schemas
    dconf
    dconf-editor
  ];
}
