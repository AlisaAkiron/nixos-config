{
  utils,
  tags,
  lib,
  ...
}:

{
  services = {
    gnome.gnome-keyring.enable = utils.hasGnome tags;
    dbus.enable = true;

    openssh = lib.mkIf (utils.isLinux tags && (!utils.isWSL tags)) {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        AllowUsers = null;
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "no";
      };
    };
  };
}
