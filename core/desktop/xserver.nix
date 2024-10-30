{ pkgs, ... }:

{
  services = {
    xserver.enable = true;
    xserver.xkb.layout = "us";
    xserver.excludePackages = [ pkgs.xterm ];
  };

  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
