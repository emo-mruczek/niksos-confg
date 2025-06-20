{ lib, stdenv, fetchFromGitHub }: 
stdenv.mkDerivation {
    pname = "product-sans";
    version = "1.0.0";

    src = fetchFromGitHub {
      owner = "hprobotic";
      repo = "Google-Sans-Font";
      rev = "ce4644946bd4e662fec8cf9736b3f99fefa7d308";
      hash = "sha256-87dKgkb27+O3Y3qQ203PDY3yLCduvIj7hFfNAV9gLOA=";
    };

    installPhase = ''
      runHook preInstall

      mkdir -p $out/share/fonts 
      cp -v *.ttf $out/share/fonts 

      runHook postInstall
    '';

    meta = with lib; {
      description = "Google Sans Font aka Product Sans";
      longDescription = ''
        Product Sans is a geometric sans-serif typeface created by Google for branding purposes.
      '';
      # homepage = "https://fontawesome.com/";
      # license = licenses.ofl;
      platforms = platforms.all;
      maintainers = with maintainers; [];
    };
  }
