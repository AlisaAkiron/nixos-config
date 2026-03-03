{ pkgs, ... }:

{
  programs.gh = {
    enable = true;
    package = pkgs.gh;
    extensions = with pkgs; [
      gh-poi
      gh-skyline
    ];
    settings = {
      git_protocol = "https";
      editor = "nvim";
      prompt = "enabled";
      color_labels = "enabled";
      spinner = "enabled";
    };
  };
}
