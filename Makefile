# Platform detection:
#   Darwin         -> nix-darwin
#   Linux + NixOS  -> NixOS
#   Linux (other)  -> standalone home-manager (e.g. galaxy on Arch)
ifeq ($(shell uname),Darwin)
NH := nh darwin
else ifneq ($(wildcard /etc/NIXOS),)
NH := nh os
else
NH := nh home
endif

build:
	$(NH) build .

switch:
	$(NH) switch .

update:
	nix flake update
