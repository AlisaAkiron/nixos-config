{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager

    ../../core/mba-darwin-core.nix
    ../../home/mba-darwin-home.nix

    ../../options
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  services.nix-daemon.enable = true;

  system.stateVersion = 5;

  alisa-nix = {
    os = "darwin";
    tz = "Asia/Shanghai";
    role = "workstation";
    network = {
      location = "limited";
      proxy = "http://127.0.0.1:7890";
    };
  };
}
