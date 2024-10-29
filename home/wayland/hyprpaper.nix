{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
  ];

  home.file."${config.xdg.userDirs.pictures}/wallpapaer" = {
    enable = true;
    source = ../../images/wallpapers;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      ipc = "on";
      splash = false;
      preload = [
        "${config.xdg.userDirs.pictures}/wallpapaer/aqua-1.jpg"
        "${config.xdg.userDirs.pictures}/wallpapaer/aqua-2.jpg"
      ];
    };
  };
}
