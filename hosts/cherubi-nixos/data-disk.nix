{ ... }:

{
  fileSystems."/mnt/vault" = {
    device = "/dev/mapper/vault-data";
    fsType = "xfs";
  };

  fileSystems."/mnt/backup" = {
    device = "/dev/mapper/backup-data";
    fsType = "ext4";
  };
}
