{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../core/neptune-nixos-core.nix
    ../../home/neptune-nixos-home.nix
    ../../options
  ];

  networking.hostName = "neptune";
  system.stateVersion = "25.05";

  alisa-nix = {
    os = "linux";
    tz = "Asia/Shanghai";
    role = "workstation";
    network = {
      location = "limited";
      proxy = "http://127.0.0.1:7890";
    };
  };
}
