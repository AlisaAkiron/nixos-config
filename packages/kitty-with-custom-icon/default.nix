{ pkgs }:

let
  customIcns = ./kitty.app.icns;
in
pkgs.stdenv.mkDerivation {
  name = "kitty-with-custom-icon";

  src = pkgs.kitty;

  phases = [ "installPhase" ];

  installPhase = ''
    cp -r $src $out
    ${
      if pkgs.stdenv.hostPlatform.isDarwin then
        ''
          chmod 777 $out/Applications/kitty.app/Contents/Resources/kitty.icns
          cp ${customIcns} $out/Applications/kitty.app/Contents/Resources/kitty.icns
          chmod 444 $out/Applications/kitty.app/Contents/Resources/kitty.icns
        ''
      else
        ''''
    }
  '';
}
