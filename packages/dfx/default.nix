{
  pkgs,
  ...
}:

let
  package-version = "0.24.1";
  links = {
    linux-x86-64 = {
      url = "https://github.com/dfinity/sdk/releases/download/${package-version}/dfx-${package-version}-x86_64-linux.tar.gz";
      sha256 = "901582a8250af4c7c5d6d8caf3782333134d431439cbfe09abec9590792f7c1c";
    };
    darwin-x86-64 = {
      url = "https://github.com/dfinity/sdk/releases/download/${package-version}/dfx-${package-version}-x86_64-darwin.tar.gz";
      sha256 = "c71fb2591993654eb54df6856d416474915ee0b242ea37279a704f9c97bf4484";
    };
  };
in 
pkgs.stdenv.mkDerivation {
  pname = "dfx";
  version = package-version;

  # Download the tar.gz file from the GitHub release
  src = if pkgs.stdenv.isLinux then
    pkgs.fetchurl {
      url = links.linux-x86-64.url;
      sha256 = links.linux-x86-64.sha256;
    }
  else if pkgs.stdenv.isDarwin then
    pkgs.fetchurl {
      url = links.darwin-x86-64.url;
      sha256 = links.darwin-x86-64.sha256;
    }
  else
    throw "Unsupported platform";

  # Skip the unpackPhase if it’s not producing directories
  unpackPhase = "true";

  # Unpack the tar.gz and move the binary to $out/bin
  installPhase = ''
    mkdir -p $out/bin
    tar -xzf $src
    # Adjust the following line if the binary is inside a subdirectory
    cp dfx $out/bin/dfx
    chmod +x $out/bin/dfx
  '';

  # Optional metadata
  meta = with pkgs.lib; {
    description = "The command-line interface for the IC SDK";
    license = licenses.asl20;
    platforms = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    maintainers = with maintainers; [ AlisaAkiron ];
  };
}
