build:
ifeq ($(shell uname),Darwin)
	sudo morlana build --flake ~/.nixos-config
else
	nh os build
endif

switch:
ifeq ($(shell uname),Darwin)
	sudo morlana switch --flake ~/.nixos-config
else
	nh os switch
endif

update:
	nix flake update
