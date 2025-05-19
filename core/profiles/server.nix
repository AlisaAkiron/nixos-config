{ ... }:

{
  imports = [
    ../common
    ../nixos
    ../software
  ];

  environment.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
    NH_FLAKE = "/home/alisa/.nixos-config";
  };
}
