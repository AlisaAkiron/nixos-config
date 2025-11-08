{ inputs, pkgs, ... }:

{
  imports = [
    ../options/mbp-darwin-options.nix

    inputs.home-manager.darwinModules.home-manager

    ./darwin

    ./common/ca.nix
    ./common/nix-config.nix
    ./software/packages.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  environment.etc."zprofile".text = ''
    export FLAKE="/Users/alisa/.nixos-config";
    export NH_DARWIN_FLAKE="$FLAKE";
  '';

  environment.systemPackages = with pkgs; [
    nh
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };

    users.alisa = {
      home.username = "alisa";
      home.homeDirectory = "/Users/alisa";
      home.stateVersion = "25.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.alisa = {
    name = "alisa";
    home = "/Users/alisa";
  };
}
