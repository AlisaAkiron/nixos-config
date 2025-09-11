{ pkgs, ... }:

{
  imports = [
    ../options/cherubi-nixos-options.nix

    ./profiles/cloud-server.nix

    ./modules/docker.nix

    ./external/chingc.nix
  ];

  virtualisation.docker = {
    storageDriver = "btrfs";
    daemon.settings = {
      "registry-mirrors" = [
        "https://oci.devops.quadripline.com"
      ];
      proxies = {
        "http-proxy" = "http://proxy.office.quadripline.com:7890";
        "https-proxy" = "http://proxy.office.quadripline.com:7890";
        "no-proxy" = "localhost,127.0.0.0/8,10.0.0.0/8,*.quadripline.com";
      };
    };
  };

  # use port forward on router
  networking.firewall.enable = false;

  environment.systemPackages = with pkgs; [
    lvm2
  ];
}
