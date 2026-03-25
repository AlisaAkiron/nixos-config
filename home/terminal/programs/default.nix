{ pkgs, ... }:

{
  imports = [
    ./atuin.nix
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
    sttr # string manipulation
    tabiew # view and query tabular data files
    android-tools # Android Platform Tools
    s5cmd # S3 API command line tool
    snitch # Better netstat

    # multimedia
    ffmpeg # multimedia framework
    ffmpegthumbnailer # video thumbnailer
    imagemagick # image manipulation
    exiftool # EXIF metadata manipulation
    mediainfo # media file information
    poppler-utils # PDF utilities
    pandoc # document converter
    libwebp # WebP
    libjpeg # JPEG
    libpng # PNG

    # security
    yubikey-manager # YubiKey Manager
    yubico-piv-tool # YubiKey PIV tool
    nmap # network exploration tool
  ];
}
