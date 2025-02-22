{ pkgs, inputs, ... }:

let
  modKey = if pkgs.stdenvNoCC.isDarwin then "Super" else "Ctrl";
in
{
  home.packages = [
    inputs.zjstatus.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.zellij = {
    enable = true;
    package = pkgs.zellij;
    enableZshIntegration = false;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    theme "catppuccin-mocha"
    pane_frames false
    simplified_ui true
    copy_on_select false

    keybinds clear-defaults=true {
      normal {
        bind "${modKey} c" { Copy; }
        bind "${modKey} Alt Left" { GoToPreviousTab; }
        bind "${modKey} Alt Right" { GoToNextTab; }
        bind "${modKey} w" { CloseTab; }
        bind "${modKey} t" { NewTab; }
        bind "${modKey} r" {
          SwitchToMode "RenameTab";
          TabNameInput 0;
        }
        bind "${modKey} 1" { GoToTab 1; }
        bind "${modKey} 2" { GoToTab 2; }
        bind "${modKey} 3" { GoToTab 3; }
        bind "${modKey} 4" { GoToTab 4; }
        bind "${modKey} 5" { GoToTab 5; }
        bind "${modKey} 6" { GoToTab 6; }
        bind "${modKey} 7" { GoToTab 7; }
        bind "${modKey} 8" { GoToTab 8; }
        bind "${modKey} 9" { GoToTab 9; }
      }
      renametab {
        bind "Enter" { SwitchToMode "Normal"; }
        bind "Esc" { UndoRenamePane; SwitchToMode "Normal"; }
      }
    }
  '';

  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
      pane split_direction="vertical" {
        pane
      }

      pane size=1 borderless=true {
        plugin location="file://${
          inputs.zjstatus.packages.${pkgs.stdenv.hostPlatform.system}.default
        }/bin/zjstatus.wasm" {
          format_left   "{mode}#[fg=black,bg=blue,bold] {session}  #[fg=blue,bg=#181825]{tabs}"
          format_right  "#[fg=#181825,bg=#b1bbfa]{datetime}"
          format_space  "#[bg=#181825]"

          mode_normal  "#[bg=blue] "

          border_enabled  "false"
          border_char     "─"
          border_format   "#[fg=#6C7086]{char}"
          border_position "top"

          tab_normal              "#[fg=#181825,bg=#4C4C59] #[fg=#000000,bg=#4C4C59]{index}  {name} #[fg=#4C4C59,bg=#181825]"
          tab_normal_fullscreen   "#[fg=#6C7086,bg=#181825] {index} {name} [] "
          tab_normal_sync         "#[fg=#6C7086,bg=#181825] {index} {name} <> "
          tab_active              "#[fg=#181825,bg=#ffffff,bold,italic] {index}  {name} #[fg=#ffffff,bg=#181825]"
          tab_active_fullscreen   "#[fg=#9399B2,bg=#181825,bold,italic] {index} {name} [] "
          tab_active_sync         "#[fg=#9399B2,bg=#181825,bold,italic] {index} {name} <> "

          hide_frame_for_single_pane "true"

          datetime          "#[fg=#6C7086,bg=#b1bbfa,bold] {format} "
          datetime_format   "%A, %d %b %Y %H:%M"
          datetime_timezone "Aisa/Shanghai"
        }
      }
    }
  '';
}
