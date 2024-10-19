{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editor
    nano
    vim

    # Common Utils
    git
    gnupg
    tree
    btop
    htop
    iotop
    fastfetch
    jq
    eza
    fzf

    ## Network
    curl
    wget
    iperf

    # Nix LSP
    nil
    nixfmt-rfc-style
  ];

  # Default user shell
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Fix for VSCode Remote (WSL)
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
}
