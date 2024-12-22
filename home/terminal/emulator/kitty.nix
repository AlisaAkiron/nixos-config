{
  config,
  pkgs,
  lib,
  ...
}:

let
  kitty-theme-base = "${pkgs.kitty-themes}/share/kitty-themes/themes";
in
{
  options.programs.kitty.themeSelector = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    default = {
      light = "Catppuccin-Latte";
      dark = "Catppuccin-Mocha";
      noPreference = "Catppuccin-Mocha";
    };
    description = ''
      Kitty theme selection:
      - light
      - dark
      - noPreference
    '';
  };

  config = {

    programs.kitty = {
      enable = true;
      package = (import ../../../packages/kitty-with-custom-icon { inherit pkgs; });
      catppuccin.enable = false;
      font = {
        name = "CaskaydiaCove Nerd Font";
        size = 16;
      };
      shellIntegration = {
        mode = "no-rc";
        enableZshIntegration = true;
      };
      keybindings = {
        # Clipboard
        "ctrl+c" = "copy_or_interrupt";
        "ctrl+shift+c" = "copy_to_clipboard";
        "ctrl+shift+v" = "paste_from_clipboard";

        # Scrolling
        "ctrl+up" = "scroll_line_up";
        "ctrl+down" = "scroll_line_down";
        "pageup" = "scroll_page_up";
        "pagedown" = "scroll_page_down";
        "home" = "scroll_home";
        "end" = "scroll_end";
        "ctrl+pageup" = "scroll_to_prompt -1";
        "ctrl+pagedown" = "scroll_to_prompt 1";
      };
      settings = {
        window_margin_width = 6;
      };
    };

    home.packages = [ pkgs.kitty-themes ];

    xdg.configFile."kitty/dark-theme.auto.conf".source =
      "${kitty-theme-base}/${config.programs.kitty.themeSelector.dark}.conf";

    xdg.configFile."kitty/light-theme.auto.conf".source =
      "${kitty-theme-base}/${config.programs.kitty.themeSelector.light}.conf";

    xdg.configFile."kitty/no-preference-theme.auto.conf".source =
      "${kitty-theme-base}/${config.programs.kitty.themeSelector.noPreference}.conf";
  };
}
