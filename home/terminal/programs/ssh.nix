{ ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        # security
        ForwardAgent = false;
        ForwardX11 = false;
        # keep alive
        ServerAliveInterval = 60;
        ServerAliveCountMax = 3;
        # multiplexing
        ControlMaster = "auto";
        ControlPath = "~/.ssh/sockets/%r@%h-%p";
        ControlPersist = "10m";
        # known hosts
        HashKnownHosts = false;
        UserKnownHostsFile = "~/.ssh/known_hosts";
        # miscellaneous
        AddKeysToAgent = "no";
        Compression = true;
      };
    };
  };
}
