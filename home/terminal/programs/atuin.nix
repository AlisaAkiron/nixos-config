{ pkgs, lib, ... }:

lib.mkMerge [
  {
    programs.atuin = {
      enable = true;
      package = pkgs.atuin;
      enableZshIntegration = true;
      daemon = {
        enable = true;
      };
      settings = {
        auto_sync = true;
        update_check = false;
        sync_address = "https://atuin.alisaqaq.moe";
        sync_frequency = "30m";
        search_mode = "fuzzy";
      };
      themes = {
        "catppuccin-macchiato" = {
          theme.name = "Catppuccin Macchiato";
          colors = {
            AlertInfo = "#a6da95";
            AlertWarn = "#f5a97f";
            AlertError = "#ed8796";
            Annotation = "#f5bde6";
            Base = "#cad3f5";
            Guidance = "#939ab7";
            Important = "#ed8796";
            Title = "#f5bde6";
          };
        };
      };
    };
  }

  # home-manager's atuin module omits RunAtLoad, so on macOS the launchd agent
  # never starts the daemon at login/boot (KeepAlive only restarts a process
  # that already ran once). Force it. Darwin-only: on Linux the daemon runs via
  # systemd, so the launchd tweak would be inert there.
  (lib.mkIf pkgs.stdenvNoCC.isDarwin {
    launchd.agents.atuin-daemon.config.RunAtLoad = true;
  })
]
