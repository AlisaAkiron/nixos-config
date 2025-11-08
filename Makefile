build:
ifeq ($(shell uname),Darwin)
    nh darwin build
else
	nh os build
endif

switch:
ifeq ($(shell uname),Darwin)
	nh darwin switch
else
	nh os switch
endif

update:
	nix flake update
