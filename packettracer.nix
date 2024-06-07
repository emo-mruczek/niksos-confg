{
  stdenv,
  lib,
  alsa-lib,
  autoPatchelfHook,
  copyDesktopItems,
  dbus,
  dpkg,
  expat,
  fontconfig,
  glib,
  makeDesktopItem,
  makeWrapper,
  qt5,
  requireFile,
}: {
  packettracer = stdenv.mkDerivation rec {
    pname = "packettracer";

    version = "8.2.2";

    src = requireFile {
      name = "Packet_Tracer822_amd64_signed.deb";
      sha256 = "0bgplyi50m0dp1gfjgsgbh4dx2f01x44gp3gifnjqbgr3n4vilkc";
      url = "https://www.netacad.com";
    };

    unpackPhase = ''
      runHook preUnpack

      dpkg-deb -x $src $out
      chmod 755 "$out"

      runHook postUnpack
    '';

    nativeBuildInputs = [
      autoPatchelfHook
      copyDesktopItems
      dpkg
      makeWrapper
      qt5.wrapQtAppsHook
    ];

    buildInputs = [
      alsa-lib
      dbus
      expat
      fontconfig
      glib
      qt5.qtbase
      qt5.qtmultimedia
      qt5.qtnetworkauth
      qt5.qtscript
      qt5.qtspeech
      qt5.qtwebengine
      qt5.qtwebsockets
    ];

    installPhase = ''
      runHook preInstall

      makeWrapper "$out/opt/pt/bin/PacketTracer" "$out/bin/packettracer" \
        "''${qtWrapperArgs[@]}" \
        --set QT_QPA_PLATFORMTHEME "" \
        --prefix LD_LIBRARY_PATH : "$out/opt/pt/bin"

      install -D $out/opt/pt/art/app.png $out/share/icons/hicolor/128x128/apps/ciscoPacketTracer8.png

      rm $out/opt/pt/bin/libQt5* -f

      runHook postInstall
    '';

    desktopItems = [
      (makeDesktopItem {
        name = "cisco-pt8.desktop";
        desktopName = "Cisco Packet Tracer MINE :))";
        icon = "ciscoPacketTracer8";
        exec = "packettracer8 %f";
        mimeTypes = ["application/x-pkt" "application/x-pka" "application/x-pkz"];
      })
    ];

    dontWrapQtApps = true;

    meta = with lib; {
      description = "Network simulation tool from Cisco";
      homepage = "https://www.netacad.com/courses/packet-tracer";
      sourceProvenance = with sourceTypes; [binaryNativeCode];
      license = licenses.unfree;
      maintainers = with maintainers; [lucasew];
      platforms = ["x86_64-linux"];
      mainProgram = "packettracer8";
    };
  };
}
