{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../core/wailord-core.nix
    ../../home/wailord-home.nix
  ];

  networking.hostName = "wailord";
  system.stateVersion = "25.05";
}
