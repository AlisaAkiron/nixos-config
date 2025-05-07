{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fnm
    bun
    biome
  ];

  programs.zsh.initContent = ''
    # fnm
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';
}
