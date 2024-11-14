{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      # Terminal
      ./terminal/profile-tty.nix
    ];

    home.packages = [
      (import ../packages/dfx { inherit pkgs; })
    ];
  };
}
