{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    enableZshIntegration = true;
    nix-direnv = {
      enable = true;
    };
  };
}
