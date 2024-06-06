{ 
  pkgs,
  ...
} : {
programs.kitty = {
  enable = true;
  theme = "Rosé Pine";
  font = {
    size = 15;
    name = "";
  };
  keybindings = {
    "ctrl+shift+c" = "copy_to_clipboard";
    "ctrl+shift+v" = "paste_from_clipboard";
    "ctrl+shift+enter" = "new_window_with_cwd";
    "ctrl+shift+t" = "new_tab_with_cwd";
  };
  settings = {
    confirm_os_widnow_close = 1;

  };
  shellIntegration.enableBashIntegration = true;
  };
}
