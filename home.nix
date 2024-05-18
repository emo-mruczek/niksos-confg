{
  pkgs,
  ...
}: {
  imports = [
    ./waybar.nix
    ./bash.nix
    ./git.nix
    ./wofi.nix
    ./kitty.nix
  ];

  home = {
    username = "felix";
    homeDirectory = "/home/felix";
    packages = with pkgs; [
      git
    ];

    pointerCursor = {
      package = pkgs.afterglow-cursors-recolored;
      name = "Afterglow-Recolored-Joris-v2";
      size = 24;
      gtk.enable = true;
    };

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
