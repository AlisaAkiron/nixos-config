{ ... }:

{
  imports = [
    ../common
    ../nixos
    ../software

    ../modules/docker.nix
  ];

  environment.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
    NH_FLAKE = "/home/alisa/.nixos-config";
  };

  networking.firewall.enable = false;

  virtualisation.docker = {
    daemon.settings = {
      "registry-mirrors" = [
        "https://oci.alisaqaq.moe"
      ];
      "metrics-addr" = "0.0.0.0:9323";
    };
    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = [
        "--all"
      ];
    };
  };

  services.prometheus.exporters.node = {
    enable = true;
    listenAddress = "0.0.0.0";
    port = 9100;
    enabledCollectors = [
      "ethtool"
      "softirqs"
      "systemd"
      "tcpstat"
    ];
  };
}
