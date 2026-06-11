{ ... }:

{
  programs.zsh.profileExtra = ''
    # JetBrains Toolbox App scripts
    export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

    # OrbStack: command-line tools and integration
    source ~/.orbstack/shell/init.zsh 2>/dev/null || :
  '';
}
