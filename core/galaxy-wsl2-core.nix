{ ... }:

{
  imports = [
    ./common
    ./software
  ];

  environment.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
  };
}
