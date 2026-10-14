{
  lib,
  pkgs,
  config,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withRuby = true;
    withNodeJs = true;
    extraPackages = [
      pkgs.tree-sitter # required by nvim-treesitter (main) to build parsers
      pkgs.wakatime-cli # used by vim-wakatime
    ]
    # C compiler for nvim-treesitter parsers, kept out of the user PATH so it can't shadow the system gcc
    ++ lib.optional (config.alisa-nix.os == "linux") pkgs.gcc;
  };

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
