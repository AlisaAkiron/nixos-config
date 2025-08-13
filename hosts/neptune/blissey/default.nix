{ ... }:

{
  imports = [
    ../shared.nix
  ];

  networking.hostName = "blissey";
  system.stateVersion = "25.05";

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024; # 8 GB
    }
  ];
}
