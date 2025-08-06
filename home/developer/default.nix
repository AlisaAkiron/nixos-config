{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
in
{
  options = {
    developer = {
      web = mkEnableOption "web development tools";
      dotnet = mkEnableOption "dotnet development tools";
      lua = mkEnableOption "lua development tools";
      kubernetes = mkEnableOption "kubernetes development tools";
      python = mkEnableOption "python development tools";
      cloud = mkEnableOption "cloud development tools";
    };
  };

  imports = [
    (mkIf config.developer.web (
      import ./web {
        inherit
          config
          lib
          pkgs
          inputs
          ;
      }
    ))
    (mkIf config.developer.dotnet (
      import ./dotnet {
        inherit
          config
          lib
          pkgs
          inputs
          ;
      }
    ))
    (mkIf config.developer.lua (
      import ./lua {
        inherit
          config
          lib
          pkgs
          inputs
          ;
      }
    ))
    (mkIf config.developer.kubernetes (
      import ./kubernetes {
        inherit
          config
          lib
          pkgs
          inputs
          ;
      }
    ))
    (mkIf config.developer.python (
      import ./python {
        inherit
          config
          lib
          pkgs
          inputs
          ;
      }
    ))
    (mkIf config.developer.cloud (
      import ./cloud {
        inherit
          config
          lib
          pkgs
          inputs
          ;
      }
    ))
  ];
}
