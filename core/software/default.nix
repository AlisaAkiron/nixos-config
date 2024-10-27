{ ... }:

{
  imports = [
    ./nh.nix
    ./programs.nix
    ./programs.nix
  ];

  nixpkgs.config.allowUnfree = true;
}
