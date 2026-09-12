{
  description = "Alisa's Nix/NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nix-darwin,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      nixos-systems = import ./os/nixos.nix;
      darwin-systems = import ./os/darwin.nix;
      home-systems = import ./os/home.nix;

      mkConfiguration =
        { systems, mkSystem }:
        builtins.listToAttrs (
          builtins.concatMap (
            sys:
            builtins.map (host: {
              name = host;
              value = mkSystem {
                system = sys.system;
                specialArgs = {
                  inherit inputs;
                };
                modules = sys.moduleResolver host;
              };
            }) sys.hosts
          ) systems
        );

      # Standalone home-manager configurations, keyed "<user>@<host>".
      mkHomeConfiguration =
        systems:
        builtins.listToAttrs (
          builtins.concatMap (
            sys:
            builtins.map (host: {
              name = "${sys.user}@${host}";
              value = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${sys.system};
                extraSpecialArgs = {
                  inherit inputs;
                };
                modules = sys.moduleResolver host;
              };
            }) sys.hosts
          ) systems
        );
    in
    {
      nixosConfigurations = mkConfiguration {
        systems = nixos-systems;
        mkSystem = nixpkgs.lib.nixosSystem;
      };

      darwinConfigurations = mkConfiguration {
        systems = darwin-systems;
        mkSystem = nix-darwin.lib.darwinSystem;
      };

      homeConfigurations = mkHomeConfiguration home-systems;
    };
}
