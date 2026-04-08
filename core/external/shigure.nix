{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };

    users.shigure = {
      home.username = "shigure";
      home.homeDirectory = "/home/shigure";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.shigure = {
    isNormalUser = true;
    uid = 2001;
    description = "Shigure";
    extraGroups = [
      "wheel"
      "video"
      "networkmanager"
      "docker"
    ];
    hashedPassword = "$6$m3s6yW6md7PkGtbc$dug5A8Omq81C5a/ZmscaGJJZmTaDsLnr8eOBLwmPsC4hFVMa8ONAeQNWU/GGOcm49i/vyE1Olu5fQUSxhw0c31";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEMED4AtnwUnJLOe2ww+ACI+SorGQJUpxpNTP+0dUm4R nyakori@work"
    ];
    shell = pkgs.zsh;
  };
}
