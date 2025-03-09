build:
	nh os switch

build-darwin:
	morlana switch --flake ~/.nixos-config

build-darwin-proxy-local:
	HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=http://127.0.0.1:7890 morlana switch --flake ~/.nixos-config

build-proxy-local:
	sudo HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=http://127.0.0.1:7890 nh os switch -R

build-proxy-router:
	sudo HTTP_PROXY=http://10.233.0.1:7890 HTTPS_PROXY=http://10.233.0.1:7890 nh os switch -R

update:
	nix flake update

update-proxy-local:
	HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=http://127.0.0.1:7890 nix flake update

update-proxy-router:
	HTTP_PROXY=http://10.233.0.1:7890 HTTPS_PROXY=http://10.233.0.1:7890 nix flake update
