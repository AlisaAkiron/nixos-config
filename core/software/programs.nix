{ pkgs, ... }:

{
  programs.zsh.enable = true;

  programs.dconf.enable = true;
  programs.git.enable = true;
  programs.gnupg.agent.enable = true;

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
}
