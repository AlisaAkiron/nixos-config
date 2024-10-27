{ ... }:

{
  imports = [
    ./nh.nix
    ./programs.nix
    ./programs.nix
    ./packages.nix
  ];

  nixpkgs.config.allowUnfree = true;
}
