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
    ];
    casks = [
      # Tools
      "1password-cli"
      "gpg-suite"
      "maccy"
      "maczip"
      "raycast"
      "stats"

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

      # Apps
      "appcleaner"
      "calibre"
      "coconutbattery"
      "discord"

      # Multimedia
      "iina"
      "losslesscut"

      # Creative
      "sigil"

      # Dev Tools
      "switchhosts"
      "xcodes"

      # Network
      "openvpn-connect"
    ];
  };
}
