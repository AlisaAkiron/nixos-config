{ ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
      enableOnBoot = true;
      daemon = {
        settings = {
          registry-mirrors = [
            "https://oci.alisaqaq.moe"
          ];
        };
      };
    };
  };
}
