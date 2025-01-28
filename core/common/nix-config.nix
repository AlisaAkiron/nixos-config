{ lib, pkgs, ... }:

let
  isNotDarwin = !pkgs.stdenvNoCC.isDarwin;
  substitutes =
    if isNotDarwin then
      [
        "https://anyrun.cachix.org"
        "https://hyprland.cachix.org"
        "https://cache.nixos.org"

        "https://mirrors.cernet.edu.cn/nix-channels/store"
      ]
    else
      [
        "https://ryanccn.cachix.org"

        "https://mirrors.cernet.edu.cn/nix-channels/store"
      ];
  trustedPublicKeys =
    if isNotDarwin then
      [
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ]
    else
      [
        "ryanccn.cachix.org-1:Or82F8DeVLJgjSKCaZmBzbSOhnHj82Of0bGeRniUgLQ="
      ];
in
{
  nix = {
    optimise = lib.mkIf isNotDarwin {
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
      substituters = substitutes;
      trusted-public-keys = trustedPublicKeys;
    };
  };
}
