{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    
    ./common/nix-config.nix
    ./software/packages.nix
  ];

  programs.zsh.enable = true;

  environment.etc."zprofile".text = ''
    export FLAKE="/Users/alisa/.nixos-config";
  '';

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };

    users.alisa = {
      home.username = "alisa";
      home.homeDirectory = "/Users/alisa";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.alisa = {
    name = "alisa";
    home = "/Users/alisa";
  };
}
