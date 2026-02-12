{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.spicetify-nix.nixosModules.default];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle
      fullAlbumDate
      playlistIcons
      goToSong
      skipStats
      wikify
      songStats
      copyToClipboard
      history
      betterGenres
      autoSkip
      playNext
      copyLyrics
      playingSource
      # beautifulLyrics
    ];

    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      ncsVisualizer
      lyricsPlus
      betterLibrary
    ];

    #theme = spicePkgs.themes.comfy;
    #colorScheme = "rose-pine";
  };
}
