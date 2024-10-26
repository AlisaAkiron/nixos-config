{ ... }:

{
  imports = [
    ./common
    ./desktop
    ./nixos
    ./software
  ];

  environment.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
  };
}
