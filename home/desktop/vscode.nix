{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions =
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

    userSettings = {
      # Mise
      "security.workspace.trust.enabled" = false;
      "window.restoreWindows" = "none";
      "gitlab.duoChat.enabled" = false;
      "redhat.telemetry.enabled" = false;

      # Workbench
      "workbench.colorTheme" = "Eva Dark Italic";
      "workbench.preferredLightColorTheme" = "Eva Light Italic";
      "workbench.preferredDarkColorTheme" = "Eva Dark Italic";
      "workbench.iconTheme" = "material-icon-theme";

      # Editor
      "editor.fontFamily" = "'Maple Mono SC NF', 'Courier New', monospace";
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.fontSize" = 20;
      "editor.inlineSuggest.enable" = true;
      "editor.linkedEditing" = true;
      "editor.unicodeHighlight.allowedLocales" = {
        "zh-hant" = true;
      };

      # Git
      "git.autofetch" = true;

      # Explorer
      "explorer.compactFolders" = false;
      "explorer.confirmDelete" = false;

      # Copilot
      "github.copilot.enable" = {
        "*" = true;
      };
      "github.copilot.editor.enableAutoCompletions" = true;

      # Nix IDE
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "nixfmt" ];
          };
          "nixpkgs" = {
            "expr" = "import <nixpkgs> { }";
          };
          "options" = {
            "nixos" = {
              "expr" = "(builtins.getFlake \"/home/alisa/.nixos-config\").nixosConfigurations.neptune.options";
            };
            "home_manager" = {
              "expr" = "(builtins.getFlake \"github:nix-community/home-manager\").nixosConfigurations.neptune.options";
            };
          };
        };
      };
    };
  };
}
