{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./btop.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./ripgrep.nix
    ./ssh.nix
    ./yazi.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    # archives
    zip
    unzip
    gzip
    ouch

    # utils
    gnumake
    file
    sttr

    # multimedia
    ffmpeg
    ffmpegthumbnailer
    imagemagick
    poppler # PDF

    # security
    yubikey-manager
    yubico-piv-tool
  ];
}
