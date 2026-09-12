{
  config,
  pkgs,
  lib,
  ...
}:

let
  # On macOS ghostty comes from Homebrew; on standalone home-manager hosts
  # (foreign distro) a nixpkgs GUI app lacks working OpenGL, so install it
  # with the distro package manager instead. Only the config is managed here.
  installPackage = !pkgs.stdenvNoCC.isDarwin && !config.alisa-nix.standalone-home;
in
{

  home.packages = lib.mkIf installPackage [
    pkgs.ghostty
  ];

  xdg.configFile."ghostty/config".text = ''
    font-family = "Maple Mono NF CN"
    font-size = 16
    theme = dark:Catppuccin Mocha,light:Catppuccin Latte
    window-padding-balance = true
    window-padding-color = background
    cursor-style = bar
    cursor-style-blink = true
    shell-integration-features = no-cursor
  '';
}
