{ ... }:

{
  programs.ssh = {
    extraConfig = ''
      # Wailord
      Host wailord
        HostName wailord.alisaqaq.moe
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
