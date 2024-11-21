{ pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        rime-data
        fcitx5-gtk
        fcitx5-fluent
        fcitx5-catppuccin
        fcitx5-chinese-addons
        fcitx5-rime
      ];
    };
  };
}
