{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    catppuccin.enable = true;
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
}
