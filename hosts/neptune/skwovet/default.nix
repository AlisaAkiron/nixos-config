{ ... }:

{
  imports = [
    ../shared.nix
  ];

  networking.hostName = "skwovet";
  system.stateVersion = "25.05";
}
