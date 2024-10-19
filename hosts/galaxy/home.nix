{ ... }:

{
  imports = [
    ../../home
  ];

  programs.git = {
    extraConfig = {
      credential = {
        helper = [
          "cache --timeout 21600"
          "oauth"
        ];
      };
    };
  };

}
