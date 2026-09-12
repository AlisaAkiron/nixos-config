{ pkgs, ... }:

{
  environment.systemPackages = import ./package-list.nix pkgs;
}
