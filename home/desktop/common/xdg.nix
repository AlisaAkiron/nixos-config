{ ... }:

{
  # disable kwallet
  xdg.configFile."kwalletrc".text = ''
    [Wallet]
    Enabled=false
  '';

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
