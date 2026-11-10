{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # Workaround: nixpkgs#537108 forces zstd-sys to use pkg-config, but fnm's
    # package doesn't provide it yet. Track nixpkgs#570944 and drop when fixed.
    (fnm.overrideAttrs (old: {
      nativeBuildInputs = old.nativeBuildInputs ++ [ pkg-config ];
      buildInputs = (old.buildInputs or [ ]) ++ [ zstd ];
    }))
    bun
    biome
  ];

  programs.zsh.initContent = lib.mkAfter ''
    # fnm
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';

  home.sessionPath = [
    "$HOME/.bun/bin"
  ];
}
