{ lib, ... }:

{
  options.alisa-nix = {

    os = lib.mkOption {
      type = lib.types.enum [
        "darwin"
        "linux"
      ];
      default = "linux";
    };

    tz = lib.mkOption {
      type = lib.types.str;
      default = "Asia/Shanghai";
    };

    role = lib.mkOption {
      type = lib.types.enum [
        "workstation"
        "server"
      ];
      default = "workstation";
    };

    network = {
      location = lib.mkOption {
        type = lib.types.enum [
          "limited"
          "public"
        ];
        default = "public";
      };

      proxy = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
    };

  };
}
