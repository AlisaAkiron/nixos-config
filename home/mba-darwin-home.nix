{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      ./common
    ];
  };
}
