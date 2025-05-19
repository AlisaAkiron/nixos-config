{ ... }:

{
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
}
