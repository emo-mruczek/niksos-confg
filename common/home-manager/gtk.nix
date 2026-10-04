{pkgs, ...} : {
  gtk = {
    # enable = true; rose-pine not in nixpkgs 
   gtk3 = {
      iconTheme = {
        name =  "rose-pine";
        package = pkgs.rose-pine-icon-theme;
    };
      theme = {
        name = "rose-pine";
        package = pkgs.rose-pine-gtk-theme;
      };
    }; 
  gtk4 = {
      iconTheme = {
        name =  "rose-pine";
        package = pkgs.rose-pine-icon-theme;
    };
      theme = {
        name = "rose-pine";
        package = pkgs.rose-pine-gtk-theme;
      };
    }; 
  };
}
