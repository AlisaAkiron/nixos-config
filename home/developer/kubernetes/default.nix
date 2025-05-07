{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kubectl
    k9s
    kubernetes-helm
    kubecm
  ];

  programs.zsh = {
    initContent = ''
      # kubectl
      source <(kubectl completion zsh)

      # k9s
      source <(k9s completion zsh)

      # kubernetes-helm
      source <(helm completion zsh)

      # kubecm
      source <(kubecm completion zsh)
    '';
    shellAliases = {
      k = "kubectl";
      kcm = "kubecm";
    };
  };
}
