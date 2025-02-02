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
      location = "limited";
      proxy = "http://127.0.0.1:7890";
    };
  };
}
