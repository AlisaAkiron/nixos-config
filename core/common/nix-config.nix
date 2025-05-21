{ lib, config, ... }:

let
  allSubstitutes = [
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
