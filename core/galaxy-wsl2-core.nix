{ ... }:

{
  imports = [
    ./common
    ./software
  ];

  environment.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
  };

  systemd.services.nix-daemon.environment = {
    http_proxy = "http://127.0.0.1:7890";
    https_proxy = "http://127.0.0.1:7890";
  };
}
