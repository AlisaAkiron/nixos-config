{ ... }:

{
  programs.zsh.initContent = ''
    # fnm
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';
}
