{ ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      # List files
      ls = "eza";
      ll = "ls -l";
      la = "ls -al";
      lt = "ls -lT";
      lt1 = "ls -lT -L=1";
      lt2 = "ls -lT -L=2";
      lt3 = "ls -lT -L=3";
    };
    oh-my-zsh = {
      enable = true;
      theme = "fino";
      plugins = [
        "git"
        "docker"
        "docker-compose"
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
  };
}
