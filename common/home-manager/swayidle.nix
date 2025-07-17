{lib, config, pkgs, inputs, ...}: {
    services.swayidle = {
    enable = true;
    timeouts = [
      { 
        timeout = 240;
        command = "${lib.getExe' pkgs.dunst "dunstify"} -t 5000 -u normal 'Locking in 1 minute'";
      }
      {
        timeout = 300;
        command = "${lib.getExe config.programs.swaylock.package} -f";
      }
      {
        timeout = 400;
        command = "${lib.getExe' inputs.hyprland.packages.${pkgs.system}.hyprland "hyprctl"} dispatch dpms off"; 
        resumeCommand = "${lib.getExe' inputs.hyprland.packages.${pkgs.system}.hyprland "hyprctl"} dispatch dpms on"; 

      }
      {
        timeout = 420;
        command = "${lib.getExe' pkgs.systemd "systemctl"} suspend";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${lib.getExe config.programs.swaylock.package} -f";
      }
    ];
  };
}
