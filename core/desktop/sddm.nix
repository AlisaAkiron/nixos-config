{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
    autoNumlock = true;
    wayland.enable = true;
    extraPackages = with pkgs.kdePackages; [
      breeze-icons
      qtsvg
      qtvirtualkeyboard
      kirigami
    ];
  };

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      font = "Noto Sans";
      fontSize = "9";
      background = "${../../images/login-background.png}";
      loginBackground = true;
    })
  ];
}
