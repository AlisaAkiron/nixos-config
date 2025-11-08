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
  };

  home.packages = lib.mkIf (config.alisa-nix.os == "linux") [
    pkgs.gcc
  ];

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
