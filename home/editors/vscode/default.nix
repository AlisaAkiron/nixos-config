{ pkgs, ... }:

{
  imports = [
    ./extensions.nix
    ./settings.nix
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
  };
}
