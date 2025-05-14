{ ... }:

{
  imports = [
    ../shared.nix
  ];

  networking.hostName = "blissey";
  system.stateVersion = "25.05";
}
