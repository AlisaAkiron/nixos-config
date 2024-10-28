{ pkgs, ... }:

{
  home.packages = with pkgs; [
    microsoft-edge
    atlauncher
    qq
  ];
}
