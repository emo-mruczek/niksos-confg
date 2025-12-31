{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        #height = 32;
        spacing = 1;
        passthrough = false;
        fixed-center = true;
        modules-left = ["hyprland/workspaces" "hyprland/mode" "hyprland/taskbar"];
        modules-center = ["hyprland/window" "custom/hello-from-waybar" "mpris"];
        modules-right = ["cpu" "temperature" "memory" "pulseaudio" "clock" "clock#simpleclock" "battery" "tray" "custom/power"];

        "custom/hello-from-waybar" = {
          format = "{}";
          max-length = 40;
          interval = "once";
          exec = pkgs.writeShellScript "hello-from-waybar" ''echo "HoHoHo :3c" '';
        };
        "wlr/workspaces" = {
          on-click = "activate";
          format = "{name}";
          all-outputs = true;
          disable-scroll = false;
          active-only = false;
        };
        "tray" = {
          show-passive-items = true;
          spacing = 10;
        };
        "clock#simpleclock" = {
          tooltip = false;
          format = "󰅐  {:%H:%M}";
        };
        "clock" = {
          format = "  {:%a %d %b}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "cpu" = {
          format = "  {usage}%";
          tooltip = true;
          interval = 1;
        };
        "temperature" = {
          format = "  {temperatureC}°C";
          tooltip = true;
          interval = 1;
        };
        "memory" = {
          format = "  {used:0.2f}G";
          interval = 1;
        };
        "battery" = {
          format = "{icon} {capacity}% {power:0.2f}W";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰁹"];
          interval = 1;
          states = {
            critical = 20;
          };
        };
        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = " ";
          format-icons = {
            headphone = " ";
            phone = "";
            portable = "";
            car = "";
            default = [" " " " " "];
          };
          on-click = "pavucontrol";
        };
        "custom/logo" = {
          format = "";
          tooltip = false;
        };
        "custom/sep" = {
          format = "|";
          tooltip = false;
        };
        "custom/power" = {
          tooltip = false;
          on-click = "wlogout -p layer-shell &";
          format = "⏻ ";
        };
        "mpris" = {
          interval = 1;
          format = "{player_icon} {title} - {artist}";
          format-paused = "{status_icon} {title} - {artist}";
          player-icons = {
            default = "󰽴";
          };
          status-icons = {
            paused = "󰏤";
          };
          "ignored-players" = [
            "firefox"
          ];
        };
      };
    };

    style = ''
        @define-color base            #191724;
        @define-color surface         #1f1d2e;
        @define-color overlay         #26233a;

        @define-color muted           #6e6a86;
        @define-color subtle          #908caa;
        @define-color text            #e0def4;

        @define-color love            #eb6f92;
        @define-color gold            #f6c177;
        @define-color rose            #ebbcba;
        @define-color pine            #31748f;
        @define-color foam            #9ccfd8;
        @define-color iris            #c4a7e7;

        @define-color highlightLow    #21202e;
        @define-color highlightMed    #403d52;
        @define-color highlightHigh   #524f67;


      * {
        min-height: 0;
        font-family: Lexend, "Font JetBrainsMono 6 Free Solid";
        font-size: 20px;
        font-weight: 500;
      }

      window#waybar {
        transition-property: background-color;
        transition-duration: 0.5s;
        background-color: rgba(24, 24, 37, 0.6);
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      #workspaces {
        background-color: transparent;
      }

      #workspaces button {
        all: initial;
        min-width: 0;
        box-shadow: inset 0 -3px transparent;
        padding: 2px 10px;
        min-height: 0;
        margin: 4px 4px;
        border-radius: 8px;
        background-color: #181825;
        color: @text;
        }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        color: #1e1e2e;
        background-color: #cdd6f4;
      }

      #workspaces button.active {
        color: #1e1e2e;
        background-color: #89b4fa;
      }

      #workspaces button.urgent {
        background-color: #f38ba8;
      }

      #clock,
      #pulseaudio,
      #custom-logo,
      #custom-power,
      #cpu,
      #tray,
      #memory,
      #temperature,
      #battery,
      #mpris,
      #window {
        min-height: 0;
        padding: 2px 10px;
        border-radius: 8px;
        margin: 4px 4px;
        background-color: @base;
      }

      @keyframes blink {
        to {
            background-color: @red;
        }
      }

      #battery.critical:not(.charging) {
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #custom-sep {
        padding: 0px;
        color: #585b70;
      }

      window#waybar.empty #window {
        background-color: transparent;
      }

      #memory {
        color: @love;
      }

      #cpu {
        color: @gold;
      }

      #temperature {
          color: @gold;
      }

      #pulseaudio {
        color: @subtle;
      }

      #pulseaudio.muted {
        color: @subtle;
      }

      #clock {
        color: @pine;
      }

      #clock.simpleclock {
        color: @rose;
      }

      #battery {
        color: @iris;
      }

      #window {
        color: @foam;
      }

      #custom-logo {
        color: #89b4fa;
      }

      #custom-power {
        color: #f38ba8;
        padding-right: 5px;
        font-size: 14px;
      }

      #mpris {
        color: @foam;
      }

      #custom-hello-from-waybar {
        color: @text;
      }

      @keyframes blink {
        to {
          background-color: #f38ba8;
          color: #181825;
        }
      }

      tooltip {
        border-radius: 8px;
      }
    '';
  };
}
