{ ... }:

{
  imports = [
    ../shared.nix
  ];

  networking.hostName = "mime";
  system.stateVersion = "25.05";
}
