{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
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
