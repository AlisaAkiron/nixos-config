[
  {
    moduleResolver = host: [ ../hosts/wsl/${host} ];
    system = "x86_64-linux";
    hosts = [
      "galaxy" # Alisa PC
    ];
  }
  {
    moduleResolver = host: [ ../hosts/server/${host} ];
    system = "x86_64-linux";
    hosts = [
      # Public Cloud
      "wailord" # AliCloud

      # Private Cloud
      "cherubi" # Dedicated Game Server

      # Home Lab
      "owo" # TexHoo T6-N100
    ];
  }
  {
    moduleResolver = host: [
      ../hosts/neptune/${host}.nix
      ../options/neptune-vm-nixos-options.nix
    ];
    system = "x86_64-linux";
    hosts = [
      "togepi" # 100
      "blissey" # 101
      "skwovet" # 102
      "mew" # 103
      "mime" # 104
    ];
  }
]
