{ ... }:

{
  targets.darwin.defaults = {
    "com.apple.desktopservices" = {
      # Prevents .DS_Store files from being created on network volumes
      DSDontWriteNetworkStores = true;
      # Prevents .DS_Store files from being created on USB volumes
      DSDontWriteUSBStores = true;
    };
  };
}
