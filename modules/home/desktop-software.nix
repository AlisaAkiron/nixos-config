{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clash-verge-rev
    microsoft-edge
  ];
}
