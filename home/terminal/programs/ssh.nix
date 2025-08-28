{ ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        # security
        forwardAgent = false;
        forwardX11 = false;
        # keep alive
        serverAliveInterval = 60;
        serverAliveCountMax = 3;
        # multiplexing
        controlMaster = "auto";
        controlPath = "~/.ssh/sockets/%r@%h-%p";
        controlPersist = "10m";
        # known hosts
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        # miscellaneous
        addKeysToAgent = "no";
        compression = true;
      };
    };
  };
}
