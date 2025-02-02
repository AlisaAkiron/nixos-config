{ lib, config, ... }:

{
  systemd.services.nix-daemon.environment =
    lib.mkIf (config.alisa-nix.network.location == "limited" && config.alisa-nix.network.proxy != "")
      {
        http_proxy = config.alisa-nix.network.proxy;
        https_proxy = config.alisa-nix.network.proxy;
      };
}
