{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager

    ../../core/mba-darwin-core.nix
    ../../home/mba-darwin-home.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  services.nix-daemon.enable = true;

  system.stateVersion = 5;
}
