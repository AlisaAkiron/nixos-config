{ pkgs, ... }:

{
  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
    enableZshIntegration = false;
  };

  programs.zsh.initContent = ''
    # Zoxide
    if [[ $- == *i* ]]; then
      eval "$(${pkgs.zoxide}/bin/zoxide init zsh --cmd cd)"
    fi
  '';
}
