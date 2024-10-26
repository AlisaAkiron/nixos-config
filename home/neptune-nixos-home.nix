{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      ./common
      ./desktop
    ];

    # Extra packages
    home.packages = with pkgs; [
      rocmPackages.rocm-smi
    ];

    # SSH
    programs.ssh = {
      extraConfig = ''
        Host *
          IdentityAgent ~/.1password/agent.sock
      '';
    };
  };
}
