{ ... }:

{
  imports = [
    ./values
  ];

  alisa-nix = {
    os = "linux";
    standalone-home = true;
    tz = "Asia/Shanghai";
    role = "workstation";
    network = {
      location = "limited";
      proxy = "http://127.0.0.1:7890";
    };
  };
}
