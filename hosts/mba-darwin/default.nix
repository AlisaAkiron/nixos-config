{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager

    ../../core/mba-darwin-core.nix
    ../../home/mba-darwin-home.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 5;
}
