{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      # Terminal
      ./terminal/profile-tty.nix
    ];
  };
}
