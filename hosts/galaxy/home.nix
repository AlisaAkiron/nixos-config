{ ... }:

{
  imports = [
    ../../home
  ];

  # Use Windows Gpg4win
  services.gpg-agent.enable = true;
  services.gpg-agent.extraConfig = ''
    default-cache-ttl 34560000
    max-cache-ttl 34560000
    pinentry-program "/mnt/d/Developer/GnuPG/bin/pinentry-basic.exe"
  '';
}
