{pkgs, ...}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "rose-pine";
      theme_background = true;
    };
  };
}
