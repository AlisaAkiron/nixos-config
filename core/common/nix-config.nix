{ lib, config, ... }:

let
  allSubstitutes = [
    {
      url = "https://mirrors.cernet.edu.cn/nix-channels/store";
      role = [ ];
      os = [ ];
      location = [ "limited" ];
    }
    {
      url = "https://ryanccn.cachix.org";
      role = [ ];
      os = [ "darwin" ];
      location = [ ];
    }
    {
      url = "https://anyrun.cachix.org";
      role = [ "workstation" ];
      os = [ "linux" ];
      location = [ ];
    }
    {
      url = "https://hyprland.cachix.org";
      role = [ "workstation" ];
      os = [ "linux" ];
      location = [ ];
    }
  ];
  trustedPublicKeys = [
    "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    "ryanccn.cachix.org-1:Or82F8DeVLJgjSKCaZmBzbSOhnHj82Of0bGeRniUgLQ="
  ];

  filteredSubs = builtins.filter (
    sub:
    (builtins.length sub.os == 0 || builtins.elem config.alisa-nix.os sub.os)
    && (builtins.length sub.role == 0 || builtins.elem config.alisa-nix.role sub.role)
    && (
      builtins.length sub.location == 0 || builtins.elem config.alisa-nix.network.location sub.location
    )
  ) allSubstitutes;
in
{
  nix = {
    optimise = lib.mkIf (config.alisa-nix.os == "linux") {
      automatic = true;
      dates = [ "02:20" ];
    };

    settings = {
      narinfo-cache-positive-ttl = 60 * 60 * 24;
      trusted-users = [
        "root"
        "@wheel"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = builtins.map (s: s.url) filteredSubs;
      trusted-public-keys = trustedPublicKeys;
    };
  };

  systemd.services.nix-daemon.environment =
    lib.mkIf (config.alisa-nix.network.location == "limited" && config.alisa-nix.network.proxy != "")
      {
        http_proxy = config.alisa-nix.network.proxy;
        https_proxy = config.alisa-nix.network.proxy;
      };
}
