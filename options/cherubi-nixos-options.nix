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
      location = "limited";
      proxy = "http://172.20.1.1:7890";
    };
  };
}
