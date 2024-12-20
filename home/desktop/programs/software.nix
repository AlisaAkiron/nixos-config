{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Browser
    (microsoft-edge.override {
      commandLineArgs = [
        "--enable-wayland-ime"
      ];
    })

    # Utils
    sonobus # Audio Stream in LAN
    # mission-center # System Monitor (unable to build)
    loupe # Image Viewer
    vlc # Media Player

    # Social
    qq
    discord
  ];
}
