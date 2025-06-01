{
  config,
  lib,
  pkgs,
  ...
}:

let
  extraAlias =
    if config.alisa-nix.network.location == "limited" then
      {
        useproxy = "export http_proxy=${config.alisa-nix.network.proxy} https_proxy=${config.alisa-nix.network.proxy}";
        clearproxy = "unset http_proxy https_proxy";
      }
    else
      { };
in
{
  programs.zsh = {
    enable = true;
    shellAliases = lib.mkMerge [
      {
        # List files
        ls = "eza";
        ll = "ls -l";
        la = "ls -al";
        lt = "ls -lT";
        lt1 = "ls -lT -L=1";
        lt2 = "ls -lT -L=2";
        lt3 = "ls -lT -L=3";
        # bat
        cat = "bat";
        cat-log = "bat --paging=never --language=log";
        cat-help = "bat --plain --language=help";
        fzf-preview = ''fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'';
        # sttr
        s = "sttr";
        b64 = "sttr base64-encode";
        b64d = "sttr base64-decode";
      }
      extraAlias
    ];
    oh-my-zsh = {
      enable = true;
      theme = "fino";
      plugins = [
        "git"
        "fzf"
      ];
      extraConfig = ''
        CASE_SENSITIVE="true"
        HYPHEN_INSENSITIVE="true"
        DISABLE_MAGIC_FUNCTIONS="true"
        DISABLE_UNTRACKED_FILES_DIRTY="true"

        FZF_BASE="${pkgs.fzf.outPath}/bin/fzf"
      '';
    };
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
  };
}
