# Standalone home-manager "core" for galaxy (Arch Linux).
# Mirrors what the NixOS / nix-darwin core modules provide at system level,
# but scoped to the user environment.
{ pkgs, ... }:

{
  imports = [
    ../options/galaxy-home-options.nix

    ./common/overlays.nix
    ./home/nix-config.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Integrate with a non-NixOS host: XDG data dirs, nix profile in session.
  targets.genericLinux.enable = true;

  home.packages = (import ./software/package-list.nix pkgs) ++ [
    pkgs.nh
  ];

  home.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
    NH_FLAKE = "/home/alisa/.nixos-config";
  };

  programs.home-manager.enable = true;
}
