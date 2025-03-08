# ref https://github.com/michaelpj/nixos-config/blob/e5be6d0f0e431748c0a8c532f9776c14e67ed8c9/nixpkgs/pkgs/sddm-themes.nix
{
  stdenv,
  fetchFromGitHub,
}: stdenv.mkDerivation {
    pname = "sddm-rose-pine";
    version = "1.2";

    src = fetchFromGitHub {
      owner = "lwndhrst";
      repo = "sddm-rose-pine";
      rev = "e8735051bf4a418efaf076f52cb3d7873ccd1509";
      sha256 = "9F+TOWqc88D9+OqQnXlaghBf1z/89XYforFspqbste0=";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/rose-pine
    '';
}
