# galaxy: Arch Linux desktop, user environment managed by standalone home-manager.
{ ... }:

{
  imports = [
    ../../../core/galaxy-home-core.nix
    ../../../home/galaxy-home.nix
  ];

  home.username = "alisa";
  home.homeDirectory = "/home/alisa";
  home.stateVersion = "25.05";
}
