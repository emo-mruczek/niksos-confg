{pkgs, lib, config, ...}: {
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
      size = 40;
      gtk.enable = true;
      x11.enable = true;
    };

    stateVersion = "23.11";
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      { 
        timeout = 240;
        command = "${lib.getExe' pkgs.dunst "dunstify"} -t 5000 -u normal 'Locking in 1 minute'";
      }
      {
        timeout = 300;
        command = lib.getExe config.programs.swaylock.package;
      }
      {
        timeout = 360;
        command = "systemctl suspend";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = lib.getExe config.programs.swaylock.package;
      }
    ];
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
    lsd = {
      enable = true;
      enableBashIntegration = true;
      colors = ''
        user: dark_red          # love
        group: dark_yellow      # gold
        permission:
          read: dark_cyan        # foam
          write: dark_magenta    # iris
          exec: dark_magenta     # rose
          exec-sticky: dark_yellow # gold
          no-access: grey        # muted
          octal: dark_grey       # subtle
          acl: cyan              # pine
          context: dark_grey     # overlay
        date:
          hour-old: white        # text
          day-old: dark_cyan     # foam
          older: dark_grey       # subtle
        size:
          none: grey             # muted
          small: dark_cyan       # pine
          medium: cyan           # foam
          large: magenta         # iris
        inode:
          valid: cyan            # foam
          invalid: grey          # muted
        links:
          valid: white           # text
          invalid: grey          # muted
        tree-edge: grey          # muted
        git-status:
          default: grey          # muted
          unmodified: dark_grey  # subtle
          ignored: grey          # muted
          new-in-index: dark_cyan # foam
          new-in-workdir: dark_cyan # foam
          typechange: dark_yellow # gold
          deleted: dark_red      # love
          renamed: dark_cyan     # pine
          modified: dark_magenta # rose
          conflicted: dark_red   # love
              '';
    };
  };
}
