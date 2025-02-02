{ ... }:

{
  imports = [
    ./values
  ];

  alisa-nix = {
    os = "linux";
    tz = "Asia/Shanghai";
    role = "server";
    network = {
      location = "public";
    };
  };
}
