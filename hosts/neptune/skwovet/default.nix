{ ... }:

{
  imports = [
    ../shared.nix
  ];

  networking.hostName = "skwovet";
  system.stateVersion = "25.05";

  neptune-vm.hasDataDrive = false;

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024; # 8 GiB
    }
  ];
}
