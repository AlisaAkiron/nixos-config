# Standalone home-manager hosts: Nix manages only the user environment,
# the OS itself is a foreign distro. Output name is "<user>@<host>",
# which is what `nh home switch` looks up by default.
[
  {
    moduleResolver = host: [ ../hosts/home/${host} ];
    system = "x86_64-linux";
    user = "alisa";
    hosts = [
      "galaxy" # Arch Linux desktop
    ];
  }
]
