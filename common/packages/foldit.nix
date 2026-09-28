 {
  fetchurl,
  stdenv,
  freeglut,
  xclip,
  autoPatchelfHook,
 libGLU,
 patchelfUnstable,
  ...
}:
stdenv.mkDerivation {
  pname = "foldit";

  version = ""; # TODO:

  src = fetchurl {
    url = "https://files.ipd.uw.edu/pub/foldit/Foldit-linux_x64.tar.gz";
    hash = "sha256-MBZO+QgW+m/tghui0MuKmONLkfXLBVS9gi0E8lh9YFQ="; # TODO:
  };

  nativeBuildInputs = [
      autoPatchelfHook
     patchelfUnstable
   ];

  buildInputs = [
      freeglut
      xclip
     stdenv.cc.cc.lib
     libGLU
   ];

   installPhase = ''
     runHook preInstall
    
     mkdir -p $out/bin 
     cp Foldit $out/bin

     runHook postInstall
   '';

   postFixup = ''
     dupa="$(cat version-binary.txt)"
     dupaa="$(cat version-database.txt)"
     dupaaa="$(cat version-resources.txt)"

     cp -r cmp-binary-$dupa $out/bin
     cp -r cmp-database-$dupaa $out/bin
     cp -r cmp-resources-$dupaaa $out/bin
     cp version-binary.txt $out/bin 
     cp version-database.txt $out/bin 
     cp version-resources.txt $out/bin
     cp versions.json $out/bin


     # echo "EXECSYACKCKCK"

     #execstack -c $out/bin/cmp-binary-"$dupa"/libtorch_cpu.so

     #echo "LPMOEOG"

     patchelf --set-rpath $out/bin/cmp-binary-$dupa $out/bin/Foldit

     echo "AAAA"

     patchelf --clear-execstack $out/bin/cmp-binary-"$dupa"/libtorch_cpu.so

     echo "BBBB"

     touch $out/bin/initial_run


     #TODO: bump patchelf version

   '';
 
 }
