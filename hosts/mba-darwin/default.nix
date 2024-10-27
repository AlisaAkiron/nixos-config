{ inputs, pkgs, ... }:

{
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
