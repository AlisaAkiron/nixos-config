{ ... }:

{
  imports = [
    ./common
    ./desktop
    ./nixos
    ./software

    ./desktop/special/proxy.nix
  ];

  environment.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
  };

  services.xserver.videoDrivers = [
    "amdgpu"
  ];
}
