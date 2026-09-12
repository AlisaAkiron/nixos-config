# Base tooling installed on every host. Consumed by
# environment.systemPackages (NixOS / nix-darwin) and by home.packages
# on standalone home-manager hosts.
pkgs: with pkgs; [
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
  nil
  nixfmt

  # Nix Utilities
  nix-output-monitor
  nvd
]
