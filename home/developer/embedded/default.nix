{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # note that: the platformio package does not support darwin
    platformio-core
    esptool
  ];
}
