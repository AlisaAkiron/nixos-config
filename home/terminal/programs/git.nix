{ pkgs, ... }:

{
  programs.git-credential-oauth = {
    enable = true;
  };

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
        "https://git.alisaqaq.moe" = {
          oauthClientId = "30bc96d0d822cbd8ba7e97cb9a39e748b68be3cd8d80b7c3c0733c2fd0489cfa";
          oauthScopes = "read_repository write_repository";
          oauthAuthURL = "/oauth/authorize";
          oauthTokenURL = "/oauth/token";
          oauthDeviceAuthURL = "/oauth/authorize_device";
        };
      };
    };
    signing = {
      signByDefault = true;
      key = "23B837CF0D5C91E404F06B148FCDF42EC5DD89D6";
    };
  };
}
