{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "alisa";
    userEmail = "alisa@alisaqaq.moe";
    extraConfig = {
      core = {
        autocrlf = "input";
      };
      init = {
        defaultBranch = "main";
      };
    };
    signing = {
      signByDefault = true;
      key = "23B837CF0D5C91E404F06B148FCDF42EC5DD89D6";
    };
  };
}
