{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clash-verge-rev
  ];
}

