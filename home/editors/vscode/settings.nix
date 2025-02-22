{ ... }:

{
  programs.vscode.userSettings = {
    # Mise
    "security.workspace.trust.enabled" = false;
    "window.restoreWindows" = "none";
    "gitlab.duoChat.enabled" = false;
    "redhat.telemetry.enabled" = false;
    "makefile.configureOnOpen" = false;

    # Auto Update
    "update.mode" = "none";
    "extensions.autoUpdate" = false;

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
    "nix.serverPath" = "nil";
    "nix.serverSettings" = {
      "nil" = {
        "formatting" = {
          "command" = [ "nixfmt" ];
        };
        "nix" = {
          "maxMemoryMB" = 4096;
          "flake" = {
            "autoArchive" = true;
            "autoEvalInputs" = true;
            "nixpkgsInputName" = "nixpkgs";
          };
        };
      };
    };
  };
}
