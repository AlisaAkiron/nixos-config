{ pkgs, ... }:

{
  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}
