{ pkgs, ... }:

let
  resurrectDirPath = "~/.config/tmux/resurrect";
in
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-ghostty";

    historyLimit = 100000;
    keyMode = "vi";
    prefix = "C-a";
    sensibleOnTop = true;
    mouse = true;
    clock24 = true;
    baseIndex = 1;

    plugins = with pkgs.tmuxPlugins; [
      {
        # https://github.com/NHDaly/tmux-better-mouse-mode
        plugin = better-mouse-mode;
      }
      {
        # https://github.com/tmux-plugins/tmux-yank
        plugin = yank;
      }
      {
        # https://github.com/omerxx/tmux-floax
        plugin = tmux-floax;
      }
      {
        # https://github.com/alexwforsythe/tmux-which-key
        plugin = tmux-which-key;
      }
      {
        # https://github.com/catppuccin/tmux
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
          set -g @catppuccin_window_left_separator "█"
          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"

          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_status_modules "application session date_time"
          set -g @catppuccin_status_left_separator  ""
          set -g @catppuccin_status_right_separator ""
          set -g @catppuccin_status_right_separator_inverse "no"
          set -g @catppuccin_status_fill "icon"
          #set -g @catppuccin_status_connect_separator "no"

          set -g @catppuccin_directory_text "#{pane_current_path}"
        '';
      }
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'

          set -g @resurrect-dir ${resurrectDirPath}
          set -g @resurrect-hook-post-save-all 'sed -i -E "s|(pane.*nvim\s*:)[^;]+;.*\s([^ ]+)$|\1nvim \2|" ${resurrectDirPath}/last'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
          set -g @continuum-systemd-start-cmd 'start-server'
        '';
      }
    ];

    extraConfig = ''
      run-shell "if [ ! -d ${resurrectDirPath} ]; then tmux new-session -d -s init-resurrect; ${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/scripts/save.sh; fi"

      # The time a message gets displyed.
      set -g display-time 4000

      # kill a session
      bind-key X kill-session
      # sets the length of session name
      set -g status-left-length 30

      # don't detach from tmux once last window of session is closed and instead
      # attach to another existing session if one exist.
      set-option -g detach-on-destroy off

      # don't rename windows automatically
      set-option -g allow-rename off

      # Ensure window index numbers get reordered on delete
      set-option -g renumber-windows on

      # Set easier window split keys
      bind-key v split-window -h
      bind-key h split-window -v

      bind-key -r s run-shell 'tmux popup -E -w 80% -h 80% "bash tmux-sessionizer"'
    '';
  };
}
