{ ... }:

{
  programs.zsh.initContent = ''
    [[ -f ~/.config/op/plugins.sh ]] && source ~/.config/op/plugins.sh
  '';
}
