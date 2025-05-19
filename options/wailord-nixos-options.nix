{ ... }:

{
  imports = [
    ./values
  ];

  alisa-nix = {
    os = "linux";
    tz = "Asia/Shanghai";
    role = "cloud-server";
    network = {
      location = "public";
    };
  };
}
