{ pkgs, ... }:

{
  programs.vscode.extensions =
    with pkgs.vscode-extensions;
    [
      # Theme
      pkief.material-icon-theme

      # Nix
      jnoortheen.nix-ide

      # Editor
      editorconfig.editorconfig
      christian-kohler.path-intellisense
      wakatime.vscode-wakatime

      # Microsoft / GitHub
      github.vscode-github-actions
      github.copilot
      github.copilot-chat
      visualstudioexptteam.vscodeintellicode
      visualstudioexptteam.intellicode-api-usage-examples

      # Git
      mhutchie.git-graph
      donjayamanne.githistory
      gitlab.gitlab-workflow
      eamodio.gitlens

      # HTML/XML/CSS
      formulahendry.auto-close-tag
      formulahendry.auto-rename-tag
      redhat.vscode-xml
      redhat.vscode-yaml
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # Theme
      {
        name = "eva-theme";
        publisher = "fisheva";
        version = "2.7.2";
        hash = "sha256-n4WvvQGFEIDlWTv0fxfhJQ/0rWSbaDRbknLMqHFUJZk=";
      }
    ];

}
