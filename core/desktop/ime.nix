{ pkgs, config, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        rime-data
        fcitx5-gtk
        fcitx5-catppuccin
        (fcitx5-rime.override {
          rimeDataPkgs = [
            config.nur.repos.linyinfeng.rimePackages.rime-ice
            rime-data
          ];
        })
      ];
    };
  };
}
