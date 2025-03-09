build:
ifeq ($(shell uname),Darwin)
	morlana switch --flake ~/.nixos-config
else
	nh os switch
endif

build-proxy-local:
ifeq ($(shell uname),Darwin)
	HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=http://127.0.0.1:7890 morlana switch --flake ~/.nixos-config
else
	sudo HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=http://127.0.0.1:7890 nh os switch -R
endif

build-proxy-router:
ifeq ($(shell uname),Darwin)
	HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=http://127.0.0.1:7890 morlana switch --flake ~/.nixos-config
else
	sudo HTTP_PROXY=http://10.233.0.1:7890 HTTPS_PROXY=http://10.233.0.1:7890 nh os switch -R
endif

update:
	nix flake update

update-proxy-local:
	HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=http://127.0.0.1:7890 nix flake update

update-proxy-router:
	HTTP_PROXY=http://10.233.0.1:7890 HTTPS_PROXY=http://10.233.0.1:7890 nix flake update
