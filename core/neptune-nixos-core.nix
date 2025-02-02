{ ... }:

{
  imports = [
    ../options/neptune-nixos-options.nix

    ./common
    ./desktop
    ./nixos
    ./software

    ./extra/clash-verge-rev.nix
    ./extra/nix-proxy.nix

    ./modules/docker.nix
  ];

  environment.sessionVariables = {
    FLAKE = "/home/alisa/.nixos-config";
  };

  services.xserver.videoDrivers = [
    "amdgpu"
  ];

  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.docker.daemon.settings.registry-mirrors = [
    "https://oci.alisaqaq.moe"
  ];

  security.pki.certificates = [
    # ASP.NET Core HTTPS development certificate
    ''
      -----BEGIN CERTIFICATE-----
      MIIDDTCCAfWgAwIBAgIJAJ8L4s5V7f98MA0GCSqGSIb3DQEBCwUAMBQxEjAQBgNV
      BAMTCWxvY2FsaG9zdDAeFw0yNDExMTIxMDQ3MDZaFw0yNTExMTIxMDQ3MDZaMBQx
      EjAQBgNVBAMTCWxvY2FsaG9zdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
      ggEBAMJf7Zl9toW9oyPncw++72vucxRj4b4M0KDFMsV7QB713qU8j4jEDvh/zBb8
      1v8CKXB9w5/yCl3Vz3nM7AnIup7BLWnPvGznbHMfBI+7qw2nzpKhTNO1WDaBsTvE
      7khGeGrEyJsWLLNT4VUw8ve+Lrw49DqGIftbvuP0n1/LssXKWpOnUd2iGGngGXQ/
      8/Gx1gIrLSYsXIAPDDQqPzLsV+ITVmr/0FVQkPXFawezxMbMgE5K91q+BsLWgWmW
      BAg+mCvyP+4XDXR6Fhi1B5P72XleEcZJZ1DQdz/vZKzcZzEEqO8atBiIfrKHW00O
      FqG5unobdYd6TxqoUhhlM5y0LeUCAwEAAaNiMGAwDAYDVR0TAQH/BAIwADAOBgNV
      HQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwEwFwYDVR0RAQH/BA0w
      C4IJbG9jYWxob3N0MA8GCisGAQQBgjdUAQEEAQIwDQYJKoZIhvcNAQELBQADggEB
      AKu/EUv18jvvrraqsFBbj2hwE9W1G8F9cysAXGFzyEt5BJn0VXQRKN9fNIZ2TULj
      rbepo8e1odaKUSprJJZuV2D/l1DwWCZnK16xOEJg68VykVxr85UgW6RVOnVn/65b
      ORMirQjycQ5fshsKsnm/k7pafdq1IGLWlJ2jNwPrqm9Xd3MctG/RyM10xZbiLBjb
      kXkZjk22Lsi2WDNEuSTXXOlafKxCZ7sH8WXSNF7S1OsPiMVfzHiuoLeYKoI9mvjT
      +Yy0hVajk6U2WqAXBFVJDjU5l0QijOD3EsexpuwxLR+i1uyHbL/W14acwVhTAXcI
      vySrBJBpL2cb21GO3GJ/xA0=
      -----END CERTIFICATE-----
    ''
  ];
}
