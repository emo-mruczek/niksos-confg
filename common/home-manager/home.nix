{pkgs, lib, config, ...} : {
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
    ./lsd.nix
    ./direnv.nix
    ./fzf.nix
    ./swayidle.nix
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
      size = 40;
      gtk.enable = true;
      x11.enable = true;
    };

    stateVersion = "23.11";
    # file.".config/hypr/".source = config.lib.file.mkOutOfStoreSymlink ./hypr;
  };

  # programs = {
  #   home-manager.enable = true;
  # };
}
