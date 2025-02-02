{ ... }:

{
  programs.zsh.initExtra = ''
    # fnm
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';
}
