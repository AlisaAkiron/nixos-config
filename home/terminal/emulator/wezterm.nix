{ config, pkgs, lib, inputs, ... }:

let
  isNotDarwin = !pkgs.stdenvNoCC.isDarwin;
  weztermPackage = if isNotDarwin
    then inputs.wezterm.packages.${pkgs.system}.default
    else (import ../../../packages/placeholder { inherit pkgs; });
  cfg = config.programs.wezterm.customExtraOptions;
in
{
  options.programs.wezterm.customExtraOptions = {
    window_decorations = lib.mkOption {
      type = lib.types.str;
      default = "TITLE | RESIZE";
      description = "Window decorations";
    };

    font_size = lib.mkOption {
      type = lib.types.str;
      default = "13.0";
      description = "Font size";
    };

    initial_rows = lib.mkOption {
      type = lib.types.str;
      default = "24";
      description = "Initial rows";
    };

    initial_cols = lib.mkOption {
      type = lib.types.str;
      default = "80";
      description = "Initial columns";
    };
  };

  config = {
      programs.wezterm = {
        enable = true;
        package = weztermPackage;
        enableZshIntegration = isNotDarwin;
        enableBashIntegration = isNotDarwin;
        extraConfig = ''
          local wezterm = require("wezterm")

          local config = wezterm.config_builder()

          config.color_scheme = "Catppuccin Mocha"

          config.font = wezterm.font_with_fallback {
            "CaskaydiaCove Nerd Font",
            "PingFang SC",
            "Microsoft YaHei",
            "Noto Sans CJK SC"
          }
          config.font_size = ${cfg.font_size}
          config.line_height = 1.2

          config.enable_tab_bar = false

          config.enable_scroll_bar = true
          config.window_decorations = "${cfg.window_decorations}"
          config.window_background_opacity = 0.85
          config.macos_window_background_blur = 10
          config.window_close_confirmation = "NeverPrompt"
          config.window_padding = {
            left = "6pt",
            right = "6pt",
            top = "6pt",
            bottom = "6pt"
          }

          config.initial_rows = ${cfg.initial_rows}
          config.initial_cols = ${cfg.initial_cols}

          config.check_for_updates = false
          config.native_macos_fullscreen_mode = true

          return config
        '';
      };
  };
}
