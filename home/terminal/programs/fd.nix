{ pkgs, ... }:

{
  programs.fd = {
    enable = true;
    package = pkgs.fd;
    ignores = [
      ".git" # git repositories
      "node_modules" # node.js dependencies
      "tmp" # temporary files
      "temp" # temporary files
      "dist" # distribution files
      "build" # build artifacts
      ".DS_Store" # macOS Finder shit
      "Thumbs.db" # Windows thumbnail cache
      ".idea" # JetBrains IDEs
      ".vscode" # Visual Studio Code settings
      ".cache" # cache directories
      ".venv" # Python virtual environments
    ];
  };
}
