{ ... }:

{
  catppuccin.btop.enable = true;

  programs.btop = {
    enable = true;

    settings = {
      theme_background = true;
      truecolor = true;
      update_ms = 500;
    };
  };
}
