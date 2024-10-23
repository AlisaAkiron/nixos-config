{ ... }:

{
  programs.zsh = {
    enable = true;
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "atomic";
  };
}
