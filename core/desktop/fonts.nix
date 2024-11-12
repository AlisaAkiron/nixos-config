{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts-emoji
    cascadia-code
    maple-mono-SC-NF
    coursier
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "CascadiaCode"
      ];
    })
  ];
}

