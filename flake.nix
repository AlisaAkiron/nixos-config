{
  description = "Alisa's Nix/NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    morlana = {
      url = "github:ryanccn/morlana";
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
      ...
    }@inputs:
    let
      nixos-systems = import ./os/nixos.nix;
      darwin-systems = import ./os/darwin.nix;

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
                modules = [
                  (sys.moduleResolver host)
                ];
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
    };
}
