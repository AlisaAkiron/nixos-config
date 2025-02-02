{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      ../options/neptune-nixos-options.nix

      # Editors
      ./editors/vscode
      ./editors/jetbrains

      # Developer
      ./developer/common.nix
      ./developer/dotnet

      # Terminal
      ./terminal/profile-desktop.nix

      # Desktop
      ./desktop/common
      ./wayland

      # Softwares
      ./desktop/programs/1password.nix
      ./desktop/programs/software.nix
      ./desktop/programs/obs.nix
    ];

    # Extra packages
    home.packages = with pkgs; [
      # rocmPackages.rocm-smi

      # Game
      moonlight-qt
    ];

    # SSH
    programs.ssh = {
      extraConfig = ''
        Host *
          IdentityAgent ~/.1password/agent.sock
      '';
    };

    # Hyprland Configurations
    wayland.windowManager.hyprland.settings = {
      monitor = [
        # HDMI-A-1 (Mi Monitor, 2K@144, right)
        # DP-1 (KTC, 4K@160, center)
        "HDMI-A-1, 2560x1440@120, 2560x0, 1, vrr, 1"
        "DP-1, 3840x2160@160, 0x0, 1.5, vrr, 1"
        ", preferred, auto, 1"
      ];
    };

    # Hyprpaper Wallpapers
    services.hyprpaper.settings = {
      wallpaper = [
        "HDMI-A-1, /home/alisa/Pictures/wallpapaer/aqua-1.jpg"
        "DP-1, /home/alisa/Pictures/wallpapaer/aqua-2.jpg"
      ];
    };
  };
}
