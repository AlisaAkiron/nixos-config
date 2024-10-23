{ pkgs, ... }:

{
  programs.dconf.enable = true;
  programs.zsh.enable = true;

  programs.git.enable = true;
  programs.gnupg.agent.enable = true;

  programs.nix-ld.enable = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };

  environment.systemPackages = with pkgs; [
    # Common Utils
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
    iperf

    # Nix LSP
    nil
    nixfmt-rfc-style
  ];
}
