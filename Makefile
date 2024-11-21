build:
	nh os switch

build-proxy-local:
	sudo HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=http://127.0.0.1:7890 nh os switch -R

build-proxy-router:
	sudo HTTP_PROXY=http://10.233.0.1:7890 HTTPS_PROXY=http://10.233.0.1:7890 nh os switch -R

debug-waybar:
	rm ${HOME}/.config/waybar/config
	rm ${HOME}/.config/waybar/style.css
	ln -s ${PWD}/home/wayland/waybar/config/config.json ${HOME}/.config/waybar/config
	ln -s ${PWD}/home/wayland/waybar/config/style.css ${HOME}/.config/waybar/style.css
	touch ${PWD}/debug-waybar

debug-waybar-restore:
	rm ${HOME}/.config/waybar/config
	rm ${HOME}/.config/waybar/style.css
	rm ${PWD}/debug-waybar
	