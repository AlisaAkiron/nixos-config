{
  description = "Alisa's Nix/NixOS Flake";

  inputs = {
    # NixOS / nixpkgs / WSL / Darwin / HM
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
    {
      nixosConfigurations = {
        # WSL2 (No Desktop) x86_64
        galaxy = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/galaxy-wsl2
          ];
        };

        # SERVERS
        wailord = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/wailord-nixos
          ];
        };

        cherubi = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/cherubi-nixos
          ];
        };
      };

      darwinConfigurations = {
        # MacBook Pro (M4 Pro, 2024) aarch64
        Alisa-MacBook-Pro = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/mbp-darwin
          ];
        };
      };
    };
}
