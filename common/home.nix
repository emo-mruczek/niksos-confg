{pkgs, ...}: {
  imports = [
    ./waybar.nix
    ./bash.nix
    ./git.nix
    ./wofi.nix
    ./kitty.nix
    ./swaylock.nix
    ./obs.nix
    ./dunst.nix
    ./btop.nix
    ./batsignal.nix
  ];

  home = {
    username = "felix";
    homeDirectory = "/home/felix";
    packages = with pkgs; [
      git
    ];

    pointerCursor = {
      package = pkgs.afterglow-cursors-recolored;
      name = "Afterglow-Recolored-Catppuccin-Mauve";
      # package = pkgs.bibata-cursors;
      #name = "Bibata-Modern-Classic";
      size = 40;
      gtk.enable = true;
      x11.enable = true;
    };

    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;
    direnv = {
      nix-direnv.enable = true;
      enable = true;
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
