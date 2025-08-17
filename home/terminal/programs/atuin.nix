{ pkgs, ... }:

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
