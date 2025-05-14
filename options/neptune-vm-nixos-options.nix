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
      proxy = "http://mihomo.pikachu.alisaqaq.moe:7890";
    };
  };
}
