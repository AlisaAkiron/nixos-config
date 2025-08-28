{ pkgs, ... }:

{
  imports = [
    ./apple-defauilts.nix
  ];

  home.packages = with pkgs; [
    syncthingtray
  ];
}
