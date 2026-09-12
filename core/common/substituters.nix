# Shared binary cache definitions. Each entry is filtered against the
# host's alisa-nix options; an empty list means "no restriction".
{
  all = [
    {
      url = "s3://nixos-cache?endpoint=s3-ssd.pikachu.alisaqaq.moe&scheme=https";
      role = [
        "homelab-server"
      ];
      os = [ "linux" ];
      location = [ ];
    }
    {
      url = "https://cache.nixos.org";
      role = [ ];
      os = [ ];
      location = [ ];
    }
    {
      url = "https://ryanccn.cachix.org";
      role = [ ];
      os = [ "darwin" ];
      location = [ ];
    }
  ];

  trustedPublicKeys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "s3-ssd.pikachu.alisaqaq.moe:Somle3h4evAQRLxykhP+DJj3X1kdY+0xmfVijzJvz+o="
    "ryanccn.cachix.org-1:Or82F8DeVLJgjSKCaZmBzbSOhnHj82Of0bGeRniUgLQ="
  ];

  # filterFor :: alisa-nix config -> [ url ]
  filterFor =
    cfg: subs:
    builtins.map (s: s.url) (
      builtins.filter (
        sub:
        (builtins.length sub.os == 0 || builtins.elem cfg.os sub.os)
        && (builtins.length sub.role == 0 || builtins.elem cfg.role sub.role)
        && (builtins.length sub.location == 0 || builtins.elem cfg.network.location sub.location)
      ) subs
    );
}
