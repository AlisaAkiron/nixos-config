{ ... }:

{
  users.users.alisa = {
    isNormalUser = true;
    uid = 1000;
    description = "Alisa Akiron";
    extraGroups = [
      "wheel"
      "video"
      "networkmanager"
      "docker"
    ];
    hashedPassword = "$y$j9T$Q/cezeSIfce8x1jP7x1/S/$4HSYp6BPIJ7AednwWdbGX5gCvohLo3PAC.p.uuOXI59";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEQA036kECw08hirC+pQZc0AQQPNwP1VriJJaBUFOzHX alisa@alisaqaq.moe"
    ];
  };
}
