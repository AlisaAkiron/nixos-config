{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    package = pkgs.fzf;
    defaultCommand = "fd --type f";
    fileWidgetOptions = [
      "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    ];
    changeDirWidgetOptions = [
      "--preview 'eza -lT -L=1 --color=always --icons=auto --group-directories-first {} | head -200'"
    ];
  };
}
