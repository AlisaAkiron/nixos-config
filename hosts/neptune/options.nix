{ lib, ... }:

{
  options.neptune-vm = {
    hasDataDrive = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether the VM has a data drive at SCSI 1.";
    };
  };
}
