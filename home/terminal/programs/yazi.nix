{ pkgs, ... }:

{
  catppuccin.yazi.enable = true;

  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
  };
}
