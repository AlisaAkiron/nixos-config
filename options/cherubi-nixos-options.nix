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
      proxy = "http://proxy.office.quadripline.com:7890";
    };
  };
}
