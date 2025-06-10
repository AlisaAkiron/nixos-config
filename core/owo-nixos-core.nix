{ pkgs, ... }:

{
  imports = [
    ../options/owo-nixos-options.nix

    ./profiles/homelab-server.nix
  ];

  virtualisation.docker.storageDriver = "btrfs";

  environment.systemPackages = with pkgs; [
    cifs-utils

    intel-media-driver
    intel-gpu-tools
  ];

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
