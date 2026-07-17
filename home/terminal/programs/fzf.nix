{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    package = pkgs.fzf;
    defaultCommand = "fd --type f";
    fileWidget.options = [
      "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    ];
    changeDirWidget.options = [
      "--preview 'eza -lT -L=1 --color=always --icons=auto --group-directories-first {} | head -200'"
    ];
    # atuin owns Ctrl-R; disable fzf's history binding to silence the conflict warning
    historyWidget.command = "";
  };
}
