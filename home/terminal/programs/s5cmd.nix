{ pkgs, lib, ... }:

let
  # Each entry defines a shell function `<name>` that wraps s5cmd. When `op` is
  # on PATH at call time, credentials are resolved from 1Password; otherwise it
  # falls back to the named AWS profile (which still requires ~/.aws/credentials).
  buckets = {
    r2 = {
      endpoint = "https://c867844ca0d13793157115d76b79c4a5.r2.cloudflarestorage.com";
      profile = "r2";
      opId = "op://Private/aat5qb643lql52nhbec4fcrxhi/username";
      opSecret = "op://Private/aat5qb643lql52nhbec4fcrxhi/credential";
    };
    rfs = {
      endpoint = "https://s3.pikachu.alisaqaq.moe";
      profile = "rustfs";
      opId = "op://Private/55itrmldtuz7qih5u4polxf5ty/username";
      opSecret = "op://Private/55itrmldtuz7qih5u4polxf5ty/password";
    };
    rfssd = {
      endpoint = "https://s3-ssd.pikachu.alisaqaq.moe";
      profile = "rustfs-ssd";
      opId = "op://Private/55itrmldtuz7qih5u4polxf5ty/username";
      opSecret = "op://Private/55itrmldtuz7qih5u4polxf5ty/password";
    };
  };

  mkFn = name: c: ''
    ${name}() {
      if command -v op >/dev/null 2>&1; then
        AWS_ACCESS_KEY_ID="$(op read "${c.opId}")" AWS_SECRET_ACCESS_KEY="$(op read "${c.opSecret}")" s5cmd --endpoint-url ${c.endpoint} "$@"
      else
        s5cmd --endpoint-url ${c.endpoint} --profile ${c.profile} "$@"
      fi
    }
  '';
in
{
  home.packages = with pkgs; [
    s5cmd
  ];

  programs.zsh.initContent = lib.concatStrings (lib.mapAttrsToList mkFn buckets);
}
