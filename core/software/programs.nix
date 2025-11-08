{ pkgs, ... }:

{
  programs.gnupg.agent.enable = true;
  programs.zsh.enable = true;

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
  };
}
