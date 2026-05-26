{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    fnm
    bun
    biome
  ];

  programs.zsh.initContent = lib.mkAfter ''
    # fnm
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';
}
