{...}: {
  programs.lsd = {
    enable = true;
    enableBashIntegration = true;
    colors = {
      user = "dark_red"; # love
      group = "dark_yellow"; # gold
      permission = {
        read = "dark_cyan"; # foam
        write = "dark_magenta"; # iris
        exec = "dark_magenta"; # rose
        exec-sticky = "dark_yellow"; # gold
        no-access = "grey"; # muted
        octal = "dark_grey"; # subtle
        acl = "cyan"; # pine
        context = "dark_grey"; # overlay
      };
      date = {
        hour-old = "white"; # text
        day-old = "dark_cyan"; # foam
        older = "dark_grey"; # subtle
      };
      size = {
        none = "grey"; # muted
        small = "dark_cyan"; # pine
        medium = "cyan"; # foam
        large = "magenta"; # iris
      };
      inode = {
        valid = "cyan"; # foam
        invalid = "grey"; # muted
      };
      links = {
        valid = "white"; # text
        invalid = "grey"; # muted
      };
      tree-edge = "grey"; # muted
      git-status = {
        default = "grey"; # muted
        unmodified = "dark_grey"; # subtle
        ignored = "grey"; # muted
        new-in-index = "dark_cyan"; # foam
        new-in-workdir = "dark_cyan"; # foam
        typechange = "dark_yellow"; # gold
        deleted = "dark_red"; # love
        renamed = "dark_cyan"; # pine
        modified = "dark_magenta"; # rose
        conflicted = "dark_red"; # love
      };
    };
  };
}
