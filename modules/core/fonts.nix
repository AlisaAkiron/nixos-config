{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    cascadia-code
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "CascadiaCode"
      ];
    })
  ];
}
