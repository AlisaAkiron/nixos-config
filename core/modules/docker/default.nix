{ options, ... }:

let
  importFiles =
    if options.alisa-nix.role == "homelab-server" then
      [ ./homelab-server.nix ]
    else if options.alisa-nix.role == "cloud-server" then
      [ ./cloud-server.nix ]
    else
      [ ];
in
{
  imports = importFiles;

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
    };
  };
}
