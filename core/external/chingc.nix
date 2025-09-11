{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };

    users.chingc = {
      home.username = "chingc";
      home.homeDirectory = "/home/chingc";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.chingc = {
    isNormalUser = true;
    uid = 2000;
    description = "ChingC";
    extraGroups = [
      "wheel"
      "video"
      "networkmanager"
      "docker"
    ];
    hashedPassword = "$y$j9T$.GaxmL5lA04XucYu4eGK/.$6ttG4ORxgeTZody.vdBiX52l4sgET7lQLzI71TBWfb2";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP29J+Un4TdGApf+btUGb72uDUnMuY2hA5DGb/ayj53u"
    ];
    shell = pkgs.zsh;
  };
}
