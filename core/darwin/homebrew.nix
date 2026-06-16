{ ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "uninstall";
      upgrade = false;
      # Homebrew 5.x requires --force/--force-cleanup/$HOMEBREW_ASK alongside
      # --cleanup; nix-darwin doesn't add it yet, so pass it explicitly.
      extraFlags = [ "--force-cleanup" ];
    };
    taps = [
      "skyhook-io/tap"
      "jetbrains/utils"
      "productdevbook/tap"
      "steipete/tap"
      "retlehs/tap"
      "darrylmorley/whatcable"
      "espressif/eim"
    ];
    brews = [
      # Network
      "cloudflared"
      "syncthing"

      # Dev Tools
      "jenv"
      "opencode"
      "opentofu"
      "glab" # GitLab CLI
      "skyhook-io/tap/radar" # Kubernetes visibility tool
      "jetbrains/utils/qodana" # JetBrains Code Quality Platform
      "retlehs/tap/quien" # A better whois and domain intelligence toolkit
      "codeburn"
      "espressif/eim/eim" # Espressif IoT Development Framework (ESP-IDF) Manager
      "cmake" # Build system (required by many C/C++ projects and also EIM)

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
      "darrylmorley/whatcable/whatcable" # Cable Info

      # MacOS Fix
      "mac-mouse-fix"
      "notunes"
      "openmtp"

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
      "trilium-notes" # Note-taking

      # Multimedia
      "losslesscut"
      "moonlight"
      "parsec"
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
      "productdevbook/tap/portkiller"
      "steipete/tap/codexbar"
      "bruno"

      # Quicklook Extensions
      "syntax-highlight" # Syntax Highlighting
      "qlmarkdown" # Markdown Preview
      "suspicious-package" # .pkg Installer Preview
      "qlstephen" # Plain Text Preview
      "quicklook-video" # Video Preview

      # Network
      "openvpn-connect"
      "tailscale-app"

      # Setapp
      "setapp"
    ];
  };
}
