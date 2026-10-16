{ pkgs, lib, ... }: let 

    inherit (lib.lists) filter;
    inherit (lib.strings) hasPrefix;

  in
{
  nixpkgs.overlays = [ (final: prev: {
    inherit (prev.lixPackageSets.stable)
      nixpkgs-review
      nix-eval-jobs
      nix-fast-build
      colmena;
  }) ];

  nix.package = pkgs.lixPackageSets.latest.lix.overrideAttrs (old: {
            # lix> Version: 1.12.1
            # lix> Source dir: /build/source
            # lix> Build dir: /build/source/build
            # lix> Build type: native build
            # lix>
            # lix> meson.build:35:0: ERROR: Unknown option: "mimalloc".
            # lix>
            # lix> A full log can be found at /build/source/build/meson-logs/meson-log.txt
            # stolen from: https://git.poz.pet/poz/niksos/src/commit/d9af3925/hosts/common/core/nix.nix#L13-L23
            mesonFlags = filter (flag: !(hasPrefix "-Dmimalloc=" flag)) (old.mesonFlags or []);
        });

}
