{ pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs # screen capture on wlroots based wayland compositors
      obs-vkcapture # vulkan capture
      obs-pipewire-audio-capture # pipewire audio capture
    ];
  };
}
