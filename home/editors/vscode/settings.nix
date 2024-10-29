{ ... }:

{
  programs.vscode.userSettings = {
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
}
