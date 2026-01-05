{ ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "uninstall";
      upgrade = false;
    };
    brews = [
      # Network
      "cloudflared"
      "syncthing"

      # Dev Tools
      "jenv"

      # System Utils
      "mole"
    ];
    casks = [
      # Tools
      "1password-cli"
      "gpg-suite"
      "maczip"
      "raycast"

      # MacOS Fix
      "mac-mouse-fix"
      "notunes"

      # Fonts
      "font-cascadia-code"
      "font-cascadia-mono"
      "font-caskaydia-cove-nerd-font"
      "font-fira-code"
      "font-intel-one-mono"
      "font-maple-mono-nf-cn"
      "font-geist-mono-nerd-font"
      "font-inter"
      "font-monocraft"
      "font-monocraft-nerd-font"
      "font-sarasa-gothic" # 更纱黑体

      # Apps
      "appcleaner"
      "calibre"
      "coconutbattery"
      "discord"
      "teamspeak-client@beta"
      "telegram"
      "unity-hub"
      "onlyoffice"
      "rustdesk"

      # Multimedia
      "iina"
      "losslesscut"
      "moonlight"
      "ndi-tools"
      "obs"
      "distroav" # OBS NDI Plugin

      # Creative
      "sigil"
      "drawio"
      "kicad"
      "blender@lts"
      "figma"

      # Dev Tools
      "switchhosts"
      "xcodes-app"
      "orbstack"
      "transmit"
      "postman"
      "devcleaner"

      # Network
      "openvpn-connect"
      "c0re100-qbittorrent"

      # Setapp
      "setapp"
    ];
  };
}
