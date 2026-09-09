{ pkgs, ... }:

{
  imports = [
    ../options/owo-nixos-options.nix

    ./profiles/homelab-server.nix
  ];

  virtualisation.docker.storageDriver = "btrfs";

  boot.kernelModules = [ "tun" ];
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    "net.ipv4.conf.all.rp_filter" = 0;
    "net.ipv4.conf.default.rp_filter" = 0;
  };

  virtualisation.docker.daemon.settings."ip-forward-no-drop" = true;

  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  hardware = {
    enableAllFirmware = true;
    intel-gpu-tools = {
      enable = true;
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
        libva-vdpau-driver # vaapiVdpau
        intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
        intel-ocl # OpenCL support
        vpl-gpu-rt # QSV on 11th gen or newer
      ];
      extraPackages32 = with pkgs; [
        intel-media-drivere
      ];
    };
  };

  fileSystems."/mnt/lapras" = {
    device = "//snorlax.pikachu.alisaqaq.moe/lapras";
    fsType = "cifs";
    options =
      let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [ "${automount_opts},credentials=/etc/nixos/smb-secrets" ];
  };
}
