{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar
    gzip

    # security
    yubikey-manager
    yubico-piv-tool
  ];
}
