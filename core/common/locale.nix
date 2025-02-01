{ config, ... }:

{
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = config.alisa-nix.tz;
}
