{ ... }:

{
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
      custom = {
        proxy = {
          command = "echo '🌐 proxy'";
          when = ''[ -n "$http_proxy" ] || [ -n "$https_proxy" ]'';
          format = "[$output]($style) ";
          style = "bold yellow";
        };
      };
    };
  };
}
