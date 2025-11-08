{ ... }:

{
  programs.nh = {
    enable = true;
    clean = {
      dates = "daily";
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
  };
}
