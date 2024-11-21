{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./btop.nix
    ./eza.nix
    ./git.nix
    ./ripgrep.nix
    ./ssh.nix
    ./zoxide.nix

    ./cli.nix
  ];

  home.packages = with pkgs; [
    gnumake
    fd
    ripgrep
  ];
}
