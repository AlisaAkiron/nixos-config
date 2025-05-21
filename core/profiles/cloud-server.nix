{ ... }:

{
  imports = [
    ../common
    ../nixos
    ../software

    ../modules/docker.nix
  ];

  environment.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
    NH_FLAKE = "/home/alisa/.nixos-config";
  };

  virtualisation.docker = {
    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = [
        "--all"
      ];
    };
  };
}
