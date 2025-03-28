{ ... }:

{
  programs.zsh = {
    shellAliases = {
      zj = "zellij";
      zji = "zellij attach --create zellij";
    };
    initExtra = ''
      if [[ -z "$ZELLIJ" ]]; then
        zellij attach --create zellij
      fi

      zellij_tab_name_update() {
        if [[ -n $ZELLIJ ]]; then
          tab_name=""
          if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
              tab_name+=$(basename "$(git rev-parse --show-toplevel)")/
              tab_name+=$(git rev-parse --show-prefix)
              tab_name=''${tab_name%/}
          else
              tab_name=$PWD
                  if [[ $tab_name == $HOME ]]; then
                tab_name="~"
                  else
                tab_name=''${tab_name##*/}
                  fi
          fi
          command nohup zellij action rename-tab $tab_name >/dev/null 2>&1
        fi
      }
      zellij_tab_name_update

      chpwd_functions+=(zellij_tab_name_update)
    '';
  };
}
