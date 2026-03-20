{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "a"; # prefix C-a
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";
    mouse = true;
    clock24 = true;
    terminal = "tmux-256color";
    sensibleOnTop = true;

    plugins = with pkgs.tmuxPlugins; [
      yank
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-strategy-nvim 'session'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10'
        '';
      }
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor 'mocha'
          set -g @catppuccin_window_status_style 'rounded'

          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_session}"
          set -ag status-right "#{E:@catppuccin_status_host}"
        '';
      }
    ];

    extraConfig = ''
      # True color support
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Split panes with | and -
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      # Vim-style pane navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Pane resize with prefix + H/J/K/L
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # Window navigation with Shift+Arrow
      bind -n S-Left previous-window
      bind -n S-Right next-window

      # New window in current path
      bind c new-window -c "#{pane_current_path}"

      # Reload config
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      # Vi copy mode enhancements
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind -T copy-mode-vi C-v send-keys -X rectangle-toggle

      # Don't rename windows automatically
      set -g allow-rename off

      # Activity monitoring
      setw -g monitor-activity on
      set -g visual-activity off

      # Renumber windows when one is closed
      set -g renumber-windows on

      # Longer display time for pane numbers and messages
      set -g display-panes-time 2000
      set -g display-time 2000
    '';
  };
}
