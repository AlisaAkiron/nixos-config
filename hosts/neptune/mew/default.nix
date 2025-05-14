{ ... }:

{
  imports = [
    ../shared.nix
  ];

  networking.hostName = "mew";
  system.stateVersion = "25.05";
}
