{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    package = pkgs.bat;
    extraPackages = with pkgs.bat-extras; [
      batgrep
    ];
    catppuccin.enable = true;
  };

  home.sessionVariables = {
    # Use as a colorizing pager for man
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
}
