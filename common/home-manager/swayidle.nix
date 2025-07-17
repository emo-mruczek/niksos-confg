{lib, config, pkgs, ...}: {
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
        timeout = 299;
        command = "${lib.getExe' pkgs.systemd "systemctl"} suspend";
      }
    ];
    # events = [
    #   {
    #     event = "before-sleep";
    #     command = lib.getExe config.programs.swaylock.package;
    #   }
    # ];
  };
}
