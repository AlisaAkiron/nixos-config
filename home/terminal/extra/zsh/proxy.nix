{ ... }:

{
  programs.zsh.shellAliases = {
    useproxy = "export http_proxy=http://127.0.0.1:7890 https_proxy=http://127.0.0.1:7890";
    useproxy-router = "export http_proxy=http://10.233.0.1:7890 https_proxy=http://10.233.0.1:7890";
    clearproxy = "unset http_proxy https_proxy";
  };
}
