{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.users.alisa = {
    imports = [
      ./common
      ./desktop
    ];

    # Extra packages
    home.packages = with pkgs; [
      rocmPackages.rocm-smi
    ];

    # SSH
    programs.ssh = {
      extraConfig = ''
        Host *
          IdentityAgent ~/.1password/agent.sock
      '';
    };

    # Hyprland Monitors
    wayland.windowManager.hyprland.settings = {
      monitor = [
        # HDMI-A-1 (Mi Monitor, 2K@144, right)
        # DP-1 (KTC, 4K@160, center)
        "HDMI-A-1, 2560x1440@120, 2560x0, 1, vrr, 1"
        "DP-1, 3840x2160@160, 0x0, 1.5, vrr, 1"
        ", preferred, auto, 1"
      ];
    };
  };
}
