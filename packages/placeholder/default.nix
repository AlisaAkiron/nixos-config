{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname = "placeholder";
  version = "1.0.0";

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/bin
    echo "echo 'This is a placeholder package'" > $out/bin/placeholder
  '';

  meta = with pkgs.lib; {
    description = "A placeholder package";
    license = licenses.mit;
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    maintainers = with maintainers; [ AlisaAkiron ];
  };
}
