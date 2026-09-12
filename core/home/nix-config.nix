{ config, pkgs, ... }:

let
  subs = import ../common/substituters.nix;
in
{
  # nix.settings is only written when nix.package is set in home-manager.
  nix = {
    package = pkgs.nix;
    settings = {
      narinfo-cache-positive-ttl = 60 * 60 * 24;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = subs.filterFor config.alisa-nix subs.all;
      trusted-public-keys = subs.trustedPublicKeys;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
