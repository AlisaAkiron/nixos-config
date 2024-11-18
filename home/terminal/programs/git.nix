{ pkgs, lib, ... }:

let 
  gitCredentialStore = if pkgs.stdenvNoCC.isDarwin then "keychain" else "cache";
inda
{
  home.packages = with pkgs; [
    gitFull
    git-credential-manager
  ];

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
      credential = {
        helper = "manager";
        "https://git.alisaqaq.moe" = {
          provider = "gitlab";
          gitlabDevClientId = "e69becbbc576cc44c376078f5a5c0e3d8bc3bcc108ef1c63e8f8904facfed786";
          gitlabDevClientSecret = "gloas-1bf10b41754d4f719bc9088a39f68a2676c0c8e72ded3f3275f2bfb0d8dad446";
        };
        credentialStore = gitCredentialStore;
      };
    };
    signing = {
      signByDefault = true;
      key = "23B837CF0D5C91E404F06B148FCDF42EC5DD89D6";
    };
  };
}
