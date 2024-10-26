{ ... }:

{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "onedark";
      theme_background = true;
      truecolor = true;
      update_ms = 500;
    };
  };
}
