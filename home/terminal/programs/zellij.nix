{ pkgs, inputs, ... }:

{
  home.packages = [
    inputs.zjstatus.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.zellij = {
    enable = true;
    package = pkgs.zellij;
    enableZshIntegration = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    theme "catppuccin-mocha"
    pane_frames false
    simplified_ui true
    copy_on_select false

    keybinds {
      unbind "Ctrl q"
      normal {
        bind "Super c" { Copy; }
        bind "Super Alt Left" { GoToPreviousTab; }
        bind "Super Alt Right" { GoToNextTab; }
        bind "Super w" { CloseTab; }
        bind "Super t" { NewTab; }
      }
    }
  '';

  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
      swap_tiled_layout name="vertical" {
        tab max_panes=5 {
          pane split_direction="vertical" {
            pane
            pane { children; }
          }
        }
        tab max_panes=8 {
          pane split_direction="vertical" {
            pane { children; }
            pane { pane; pane; pane; pane; }
          }
        }
        tab max_panes=12 {
          pane split_direction="vertical" {
            pane { children; }
            pane { pane; pane; pane; pane; }
            pane { pane; pane; pane; pane; }
          }
        }
      }

      swap_tiled_layout name="horizontal" {
        tab max_panes=5 {
          pane
          pane
        }
        tab max_panes=8 {
          pane {
            pane split_direction="vertical" { children; }
            pane split_direction="vertical" { pane; pane; pane; pane; }
          }
        }
        tab max_panes=12 {
          pane {
            pane split_direction="vertical" { children; }
            pane split_direction="vertical" { pane; pane; pane; pane; }
            pane split_direction="vertical" { pane; pane; pane; pane; }
          }
        }
      }

      swap_tiled_layout name="stacked" {
        tab min_panes=5 {
          pane split_direction="vertical" {
            pane
            pane stacked=true { children; }
          }
        }
      }

      swap_floating_layout name="staggered" {
        floating_panes
      }

      swap_floating_layout name="enlarged" {
        floating_panes max_panes=10 {
          pane { x "5%"; y 1; width "90%"; height "90%"; }
          pane { x "5%"; y 2; width "90%"; height "90%"; }
          pane { x "5%"; y 3; width "90%"; height "90%"; }
          pane { x "5%"; y 4; width "90%"; height "90%"; }
          pane { x "5%"; y 5; width "90%"; height "90%"; }
          pane { x "5%"; y 6; width "90%"; height "90%"; }
          pane { x "5%"; y 7; width "90%"; height "90%"; }
          pane { x "5%"; y 8; width "90%"; height "90%"; }
          pane { x "5%"; y 9; width "90%"; height "90%"; }
          pane focus=true { x 10; y 10; width "90%"; height "90%"; }
        }
      }

      swap_floating_layout name="spread" {
        floating_panes max_panes=1 {
            pane {y "50%"; x "50%"; }
          }
        floating_panes max_panes=2 {
          pane { x "1%"; y "25%"; width "45%"; }
          pane { x "50%"; y "25%"; width "45%"; }
        }
        floating_panes max_panes=3 {
          pane focus=true { y "55%"; width "45%"; height "45%"; }
            pane { x "1%"; y "1%"; width "45%"; }
            pane { x "50%"; y "1%"; width "45%"; }
        }
        floating_panes max_panes=4 {
          pane { x "1%"; y "55%"; width "45%"; height "45%"; }
          pane focus=true { x "50%"; y "55%"; width "45%"; height "45%"; }
          pane { x "1%"; y "1%"; width "45%"; height "45%"; }
          pane { x "50%"; y "1%"; width "45%"; height "45%"; }
        }
      }

      default_tab_template {
        pane size=2 borderless=true {
          plugin location="file://${
            inputs.zjstatus.packages.${pkgs.stdenv.hostPlatform.system}.default
          }/bin/zjstatus.wasm" {
            format_left   "{mode} #[fg=#89B4FA,bold]{session}"
            format_center "{tabs}"
            format_right  "{command_git_branch} {datetime}"
            format_space  ""

            border_enabled  "false"
            border_char     "─"
            border_format   "#[fg=#6C7086]{char}"
            border_position "top"

            hide_frame_for_single_pane "true"

            mode_normal  "#[bg=blue] "
            mode_tmux    "#[bg=#ffc387] "

            tab_normal   "#[fg=#6C7086] {name} "
            tab_active   "#[fg=#9399B2,bold,italic] {name} "

            command_git_branch_command     "git rev-parse --abbrev-ref HEAD"
            command_git_branch_format      "#[fg=blue] {stdout} "
            command_git_branch_interval    "10"
            command_git_branch_rendermode  "static"

            datetime        "#[fg=#6C7086,bold] {format} "
            datetime_format "%A, %d %b %Y %H:%M"
            datetime_timezone "Asia/Shanghai"
          }
        }
        children
      }
    }
  '';
}
