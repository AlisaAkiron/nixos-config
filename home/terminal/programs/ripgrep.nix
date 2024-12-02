{ pkgs, ... }:

{
  programs.ripgrep = {
    enable = true;
    package = pkgs.ripgrep;
    arguments = [
      # Don't output really long lines
      "--max-columns=150"
      "--max-columns-preview"

      # Ignore things in .git
      "--glob=!.git/*"
    ];
  };
}
