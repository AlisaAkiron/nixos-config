{ config, lib, ... }:

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
      }
      extraAlias
    ];
    oh-my-zsh = {
      enable = true;
      theme = "fino";
      plugins = [
        "git"
      ];
      extraConfig = ''
        CASE_SENSITIVE="true"
        HYPHEN_INSENSITIVE="true"
        DISABLE_MAGIC_FUNCTIONS="true"
        DISABLE_UNTRACKED_FILES_DIRTY="true"
      '';
    };
    envExtra = ''
      # Custom Functions
      function rand {
        length=32

        if [ "$1" != "" ]
        then
          length=$1
        fi

        head -c 512 /dev/urandom | LC_CTYPE=C tr -cd 'a-zA-Z0-9' | head -c $length && echo ""
      }

      function randb64 {
        length=32

        if [ "$1" != "" ]
        then
          length=$1
        fi

        ori=$(head -c 512 /dev/urandom | LC_CTYPE=C tr -cd 'a-zA-Z0-9' | head -c $length)
        b64=$(echo -n "$ori" | base64)

        echo $ori
        echo $b64
      }

      function rands {
        length=32

        if [ "$1" != "" ]
        then
          length=$1
        fi

        head -c 512 /dev/urandom | LC_CTYPE=C tr -cd 'a-zA-Z0-9!@;:.-+=*' | head -c $length && echo ""
      }

      function randb64s {
        length=32

        if [ "$1" != "" ]
        then
          length=$1
        fi

        ori=$(head -c 512 /dev/urandom | LC_CTYPE=C tr -cd 'a-zA-Z0-9!@;:.-+=*' | head -c $length)
        b64=$(echo -n "$ori" | base64)

        echo $ori
        echo $b64
      }

      function b64 {
        echo -n "$1" | base64
      }

      function b64d {
        echo -n "$1" | base64 -D && echo ""
      }
    '';
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
  };
}
