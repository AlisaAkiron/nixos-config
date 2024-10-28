{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editor
    vim
    nano

    # Common Utils
    git
    gnupg
    fastfetch
    jq
    eza
    fzf

    ## Network
    iperf
    wget
    curl

    # Nix IDE
    nixd
    nixfmt-rfc-style
  ];
}
