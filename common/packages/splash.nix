{
  fetchurl,
  inkscape,
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "nixowos-splash.png";

  src = fetchurl {
    url = "https://raw.githubusercontent.com/CharlotteCross1998/linuwux/refs/heads/main/nwixowos.svg";
    hash = "sha256-CikOw0CsmkfnkjTDc2iX6ncXq9SixakSemkIdAOSksA=";
  };

  dontUnpack = true;

  nativeBuildInputs = [inkscape];

  buildPhase = ''
    runHook preBuild

    inkscape --export-type=png --export-filename=$out -w 192 -h 192 $src

    runHook postBuild
  '';
}
