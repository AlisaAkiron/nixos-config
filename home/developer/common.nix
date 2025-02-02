{
  lib,
  config,
  pkgs,
  ...
}:

{
  home.packages =
    with pkgs;
    [
      jdk # JDK 21
      micromamba # Mamba (for Python)
      fnm # NodeJS version manager
      lua # Lua
    ]
    ++ lib.optional (config.alisa-nix.os == "linux") [
      gcc # C Compiler
    ];
}
