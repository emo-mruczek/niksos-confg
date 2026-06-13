{
  pkgs,
  ...
}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      ncurses5 libx11 libz glib libsm libice libxi libxrender libxrandr freetype fontconfig libxext libxcursor libuuid libxft
    ];
  };
}
