{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    catppuccin.enable = true;

    clock24 = true;
    keyMode = "vi";
    prefix = "C-Space";
    baseIndex = 1;

    extraConfig = ''
      # Mouse support
      set -g mouse on

      # Better panel splitting
      bind h split-window -h -c "#{pane_current_path}"
      bind v split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # Window navigation
      bind C-p previous-window
      bind C-n next-window
      bind -n C-left previous-window
      bind -n C-right next-window

      # VI mode keybind
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    '';

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      tmux-fzf
      yank
    ];
  };
}
