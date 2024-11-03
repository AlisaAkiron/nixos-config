{ pkgs, ... }:

{
  programs.clash-verge = {
    enable = true;
    autoStart = true;
    package = pkgs.clash-verge-rev;
    tunMode = true;
  };
}
