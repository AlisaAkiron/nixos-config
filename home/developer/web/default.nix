{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fnm
    bun
    biome
  ];

  programs.zsh.initExtra = ''
    # fnm
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';
}
