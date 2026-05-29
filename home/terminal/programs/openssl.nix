{ pkgs, config, ... }:

let
  ext = pkgs.stdenv.hostPlatform.extensions.sharedLibrary;
  providerModule = "${pkgs.pkcs11-provider}/lib/ossl-modules/pkcs11${ext}";
  # Default PKCS#11 backend: YubiKey PIV. Override by setting PKCS11_PROVIDER_MODULE.
  pkcs11Module = "${pkgs.yubico-piv-tool}/lib/libykcs11${ext}";

  opensslCnf = pkgs.writeText "openssl.cnf" ''
    openssl_conf = openssl_init

    [openssl_init]
    providers = provider_sect

    [provider_sect]
    default = default_sect
    pkcs11 = pkcs11_sect

    [default_sect]
    activate = 1

    [pkcs11_sect]
    module = ${providerModule}
    pkcs11-module-path = ${pkcs11Module}
    activate = 1
  '';
in
{
  home.packages = with pkgs; [
    openssl
    pkcs11-provider
  ];

  xdg.configFile."openssl/openssl.cnf".source = opensslCnf;

  home.sessionVariables.OPENSSL_CONF = "${config.xdg.configHome}/openssl/openssl.cnf";
}
