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
      proxy = "http://owo.pikachu.alisaqaq.moe:7890";
    };
  };
}
