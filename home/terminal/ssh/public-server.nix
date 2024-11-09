{ ... }:

{
  programs.ssh = {
    extraConfig = ''
      # Weedle
      Host weedle
        HostName weedle.alisaqaq.moe
        User alisa
        Port 22

      # Cherubi
      Host cherubi
        HostName cherubi.pichu.alisaqaq.moe
        User alisa
        Port 50022
    '';
  };
}
