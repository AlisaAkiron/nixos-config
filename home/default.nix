{ ... }:

{
  imports = [
    ./software
  ];

  home.username = "alisa";
  home.homeDirectory = "/home/alisa";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
