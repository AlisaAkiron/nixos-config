{ inputs, ... }:

{
  imports = [
    ../options/mba-darwin-options.nix

    inputs.home-manager.darwinModules.home-manager

    ./darwin

    ./common/nix-config.nix
    ./software/packages.nix
  ];

  nixpkgs.config.allowUnfree = true;

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
