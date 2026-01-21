{ lib, config, ... }:

let
  allSubstitutes = [
    {
      url = "s3://nixos-cache?endpoint=s3.pikachu.alisaqaq.moe&scheme=https";
      role = [
        "homelab-server"
      ];
      os = [ "linux" ];
      location = [ ];
    }
    {
      url = "https://cache.nixos.org";
      role = [ ];
      os = [ ];
      location = [ ];
    }
    {
      url = "https://ryanccn.cachix.org";
      role = [ ];
      os = [ "darwin" ];
      location = [ ];
    }
  ];
  trustedPublicKeys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "s3.pikachu.alisaqaq.moe:i7lAtRS6MY30G8oe/sSXuewPKvsh3cnmxB+fU18rCcA="
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
}
