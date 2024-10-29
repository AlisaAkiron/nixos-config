{ pkgs, ... }:

{
  home.packages = with pkgs; [
    microsoft-edge
    clash-verge-rev
    qq
  ];
}
