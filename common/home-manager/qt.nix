{ pkgs, ... } :{
  home.packages = with pkgs; [ libsForQt5.qtstyleplugin-kvantum qt6Packages.qtstyleplugin-kvantum ];
  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "qtct";
    kvantum = {
      enable = true;
      themes = with pkgs; [ rose-pine-kvantum materia-everforest-kvantum ];
      settings = {
       Applications = {
          "rose-pine-moon-iris" = [ "qt5ct" ];
        };
        General.theme = "rose-pine-moon-iris";
      };
   };
  };

  xdg.configFile."Kvantum/rose-pine-moon-iris".source = "${pkgs.rose-pine-kvantum}/share/Kvantum/themes/rose-pine-moon-iris";
}
