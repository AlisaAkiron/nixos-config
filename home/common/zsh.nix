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

  programs.starship = {
    enable = true;
    settings = {
      format = "$all";
      command_timeout = 10000;
      add_newline = true;
      aws = {
        symbol = "  ";
      };
      azure = {
        symbol = " ";
      };
      buf = {
        symbol = " ";
      };
      c = {
        symbol = " ";
      };
      cmake = {
        symbol = "△ ";
      };
      conda = {
        symbol = " ";
      };
      container = {
        symbol = "󰡨 ";
      };
      dart = {
        symbol = " ";
      };
      directory = {
        read_only = " ";
      };
      docker_context = {
        symbol = " ";
      };
      dotnet = {
        symbol = "󰪮 ";
      };
      elixir = {
        symbol = " ";
      };
      elm = {
        symbol = " ";
      };
      fossil_branch = {
        symbol = " ";
      };
      git_branch = {
        symbol = " ";
      };
      golang = {
        symbol = " ";
      };
      guix_shell = {
        symbol = " ";
      };
      gradle = {
        symbol = " ";
      };
      haskell = {
        symbol = " ";
      };
      haxe = {
        symbol = "⌘ ";
      };
      hg_branch = {
        symbol = " ";
      };
      hostname = {
        ssh_symbol = " ";
      };
      java = {
        symbol = " ";
      };
      julia = {
        symbol = " ";
      };
      kotlin = {
        symbol = " ";
      };
      kubernetes = {
        symbol = "󱃾 ";
        disabled = false;
      };
      lua = {
        symbol = " ";
      };
      nim = {
        symbol = " ";
      };
      nix_shell = {
        symbol = " ";
      };
      nodejs = {
        symbol = " ";
      };
      os = {
        format = "[$symbol]($style)";
        style = "bold blue";
        disabled = false;
        symbols = {
          Alpaquita = " ";
          Alpine = " ";
          Amazon = " ";
          Android = " ";
          Arch = " ";
          Artix = " ";
          CentOS = " ";
          Debian = " ";
          DragonFly = " ";
          Emscripten = " ";
          EndeavourOS = " ";
          Fedora = " ";
          FreeBSD = " ";
          Gentoo = " ";
          Linux = " ";
          Mabox = " ";
          Macos = " ";
          Manjaro = " ";
          Mariner = " ";
          MidnightBSD = " ";
          Mint = " ";
          NetBSD = " ";
          NixOS = " ";
          OpenBSD = " ";
          openSUSE = " ";
          Pop = " ";
          Raspbian = " ";
          Redhat = " ";
          RedHatEnterprise = " ";
          Redox = " ";
          Solus = " ";
          SUSE = " ";
          Ubuntu = " ";
          Unknown = " ";
          Windows = " ";
        };
      };
      package = {
        symbol = " ";
      };
      pijul_channel = {
        symbol = "🪺 ";
      };
      python = {
        symbol = " ";
      };
      ruby = {
        symbol = " ";
      };
      rust = {
        symbol = " ";
      };
      scala = {
        symbol = " ";
      };
      spack = {
        symbol = "🅢 ";
      };
    };
  };
}
