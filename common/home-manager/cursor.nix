{ pkgs, ...} : {
  home.pointerCursor = {
      enable = true;
      package = pkgs.afterglow-cursors-recolored;
      name = "Afterglow-Recolored-Catppuccin-Mauve";
      size = 40;
      gtk.enable = true;
      x11.enable = true;
    };
}
