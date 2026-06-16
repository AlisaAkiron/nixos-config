{ pkgs, ... }:

{
  programs.zsh.initContent = ''
    # ESP-IDF environment helpers (EIM-managed installations)
    idfenv() {
      local jq="${pkgs.jq}/bin/jq"
      local eim_json="''${IDF_TOOLS_PATH:-$HOME/.espressif/tools}/eim_idf.json"

      if [[ ! -f "$eim_json" ]]; then
        echo "idfenv: EIM index not found: $eim_json" >&2
        echo "idfenv: install ESP-IDF with eim first" >&2
        return 1
      fi

      case "$1" in
        list)
          # NB: do not name these "path" — local path would shadow zsh's
          # special array tied to PATH and empty it inside the function
          local v_name v_path
          "$jq" -r '.idfInstalled[] | "\(.name)\t\(.path)"' "$eim_json" | sort -V | \
            while IFS=$'\t' read -r v_name v_path; do
              if [[ -n "$IDF_PATH" && "$v_path" == "$IDF_PATH" ]]; then
                echo "* $v_name (active)"
              else
                echo "  $v_name"
              fi
            done
          ;;
        activate)
          local version="$2"
          if [[ -z "$version" ]]; then
            version=$("$jq" -r '.idfInstalled[].name' "$eim_json" | sort -V | tail -n 1)
          fi
          local script
          script=$("$jq" -r --arg v "$version" \
            '.idfInstalled[] | select(.name == $v) | .activationScript' "$eim_json")
          if [[ -z "$script" || "$script" == "null" ]]; then
            echo "idfenv: version not installed: $version" >&2
            echo "idfenv: installed versions:" >&2
            "$jq" -r '.idfInstalled[].name' "$eim_json" | sort -V | sed 's/^/  /' >&2
            return 1
          fi
          if [[ ! -f "$script" ]]; then
            echo "idfenv: activation script missing: $script" >&2
            return 1
          fi
          source "$script" && echo "idfenv: activated ESP-IDF $version"
          ;;
        current)
          if [[ -z "$IDF_PATH" ]]; then
            echo "idfenv: no ESP-IDF environment active" >&2
            return 1
          fi
          "$jq" -r --arg p "$IDF_PATH" \
            '.idfInstalled[] | select(.path == $p) | .name' "$eim_json"
          ;;
        *)
          echo "Usage: idfenv <command>" >&2
          echo "" >&2
          echo "Commands:" >&2
          echo "  list                List installed ESP-IDF versions" >&2
          echo "  activate [version]  Activate a version (default: latest)" >&2
          echo "  current             Show the active version" >&2
          return 1
          ;;
      esac
    }

    _idfenv() {
      local eim_json="''${IDF_TOOLS_PATH:-$HOME/.espressif/tools}/eim_idf.json"
      if (( CURRENT == 2 )); then
        local -a subcmds
        subcmds=(
          'list:List installed ESP-IDF versions'
          'activate:Activate a version (default: latest)'
          'current:Show the active version'
        )
        _describe 'idfenv command' subcmds
      elif (( CURRENT == 3 )) && [[ "''${words[2]}" == "activate" && -f "$eim_json" ]]; then
        compadd $(${pkgs.jq}/bin/jq -r '.idfInstalled[].name' "$eim_json" 2>/dev/null)
      fi
    }
    compdef _idfenv idfenv
  '';
}
