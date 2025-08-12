{ ... }:

{
  imports = [
    ../options/neptune-vm-nixos-options.nix

    ./profiles/homelab-server.nix
  ];

  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.docker.daemon.settings = {
    proxies = {
      "http-proxy" = "http://mihomo.pikachu.alisaqaq.moe:7890";
      "https-proxy" = "http://mihomo.pikachu.alisaqaq.moe:7890";
      "no-proxy" = "localhost,127.0.0.0/8,10.0.0.0/8,*.alisaqaq.moe";
    };
  };
}
