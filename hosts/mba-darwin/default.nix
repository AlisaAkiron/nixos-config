{ inputs, pkgs, ... }:

let
  sharedModule = import ../../core/mba-darwin.nix { inherit inputs; isDarwin = true; };
in 
{
  imports = [
    sharedModule
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  services.nix-daemon.enable = true;

  system.stateVersion = 5;

  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];

  users.users.alisa = {
    name = "alisa";
    home = "/Users/alisa";
  };
}
