{ pkgs, ... }:

{
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
      dates = "daily";
    };
    optimise = {
      automatic = true;
      dates = [ "02:20" ];
    };

    settings = {
      narinfo-cache-positive-ttl = 60 * 60 * 24;
      trusted-users = [
        "root"
        "@wheel"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://mirrors.cernet.edu.cn/nix-channels/store" ];
      extra-substituters = [ "https://cache.nixos.org/" ];
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    wget
    nano
    vim
    git
  ];

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
}
