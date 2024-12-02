{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    package = pkgs.fzf;
    catppuccin.enable = true;
    fileWidgetOptions = [
      "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    ];
    changeDirWidgetOptions = [
      "--preview 'eza -lT -L=1 --color=always --icons=auto --group-directories-first {} | head -200'"
    ];
  };
}
