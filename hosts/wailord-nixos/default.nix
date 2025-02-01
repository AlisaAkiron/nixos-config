{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../core/wailord-core.nix
    ../../home/wailord-home.nix

    ../../options
  ];

  networking.hostName = "wailord";
  system.stateVersion = "25.05";

  alisa-nix = {
    os = "linux";
    tz = "Asia/Shanghai";
    role = "server";
    network = {
      location = "public";
    };
  };
}
