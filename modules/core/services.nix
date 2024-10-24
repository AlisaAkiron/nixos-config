{
  utils,
  tags,
  lib,
  ...
}:

{
  services = {
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;

    openssh = {
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
