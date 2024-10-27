{ lib, pkgs, ... }:

let 
  isNotDarwin = !pkgs.stdenvNoCC.isDarwin;
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
      substituters = [
        "https://mirrors.cernet.edu.cn/nix-channels/store"
        "https://hyprland.cachix.org"
      ];
      extra-substituters = [ "https://cache.nixos.org/" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
  };
}
