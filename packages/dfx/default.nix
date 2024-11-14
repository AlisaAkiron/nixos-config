{
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation {
  pname = "dfx";
  version = "0.24.1";

  # Download the tar.gz file from the GitHub release
  src = pkgs.fetchurl {
    url = "https://github.com/dfinity/sdk/releases/download/0.24.1/dfx-0.24.1-x86_64-linux.tar.gz";
    sha256 = "901582a8250af4c7c5d6d8caf3782333134d431439cbfe09abec9590792f7c1c";
  };

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
    platforms = platforms.linux;
    maintainers = with maintainers; [ AlisaAkiron ];
  };
}
