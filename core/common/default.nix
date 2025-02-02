{ lib, config, ... }:

{
  imports = [
    ./locale.nix
    ./nix-config.nix
    ./security.nix
    ./user.nix
  ] ++ (lib.optionals (config.alisa-nix.os == "linux") [ ./nix-proxy.nix ]);
}
