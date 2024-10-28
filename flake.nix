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

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs =
    { nix-darwin, nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        # NixOS (With Desktop) x86_64
        neptune = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./hosts/neptune-nixos
          ];
        };

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
      };

      darwinConfigurations = {
        # MacBook Air (M1, 2020) aarch64
        Alisa-MacBook-Air = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/mba-darwin
          ];
        };
      };
    };
}
