{ pkgs, ... }:

{
  services.rustdesk-server = {
    enable = true;
    package = pkgs.rustdesk-server;
    openFirewall = true;
    relay = {
      enable = true;
    };
    signal = {
      enable = true;
    };
  };
}
