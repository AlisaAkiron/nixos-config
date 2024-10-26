{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
  ];
}
