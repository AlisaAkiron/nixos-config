{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./btop.nix
    ./eza.nix
    ./fzf.nix
    ./git.nix
    ./ripgrep.nix
    ./ssh.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar
    gzip

    # utils
    gnumake
    fd

    # security
    yubikey-manager
    yubico-piv-tool
  ];
}
