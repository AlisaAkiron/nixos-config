{ ... }:

{
  imports = [
    ../shared.nix
  ];

  networking.hostName = "togepi";
  system.stateVersion = "25.05";
}
