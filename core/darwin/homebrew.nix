{ ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "uninstall";
      upgrade = false;
    };
    taps = [
      "skyhook-io/tap"
      "jetbrains/utils"
      "productdevbook/tap"
      "steipete/tap"
    ];
    brews = [
      # Network
      "cloudflared"
      "syncthing"

      # Dev Tools
      "jenv"
      "opencode"
      "skyhook-io/tap/radar"
      "jetbrains/utils/qodana"

      # Libraries
      "sox" # Audio processing (required by Claude Code)

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
      "telegram"
      "onlyoffice"
      "rustdesk"

      # Multimedia
      "losslesscut"
      "moonlight"
      "ndi-tools"
      "obs"
      "finetune"

      # Creative
      "sigil"
      "kicad"
      "blender@lts"
      "figma"

      # Dev Tools
      "switchhosts"
      "xcodes-app"
      "orbstack"
      "postman"
      "devcleaner"
      "git-credential-manager"
      "claude"
      "claude-code"
      "productdevbook/tap/portkiller"
      "steipete/tap/codexbar"
      "superset"
      "yaak"

      # Network
      "openvpn-connect"
      "tailscale-app"

      # Setapp
      "setapp"
    ];
  };
}
