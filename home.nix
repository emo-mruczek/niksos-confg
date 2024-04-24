{ config, pkgs, ...}:

{
	home.username = "felix";
	home.homeDirectory = "/home/felix";

	home.packages = with pkgs; [
	git
	];

	programs.git = {
	enable = true;
	userName = "emo-mruczek";
	userEmail = "krokcia1@gmail.com";
	};
	
	home.pointerCursor.package = pkgs.afterglow-cursors-recolored;
	home.pointerCursor.name = "Afterglow-Recolored-Joris-v2";
	home.pointerCursor.size = 24;

	home.pointerCursor.gtk.enable = true;

	programs.bash = {
	enable = true;
	enableCompletion = true;
    shellAliases = {
        u = "nixos-rebuild switch --flake \"/home/felix/nixos-config\" -L --use-remote-sudo";
        gg = " gg() {
            git add .
            git commit -m '$1'
            git push
            }
        ";
    };
	};
    
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 32;
                spacing = 4;
                passthrough = false;
                fixed-center = true;
                modules-left = [ "hyprland/workspaces" "hyprland/mode" "hyprland/taskbar"];
                modules-center = [ "hyprland/window" "custom/hello-from-waybar"];
                modules-right = [ "cpu" "temperature" "memory" "pulseaudio" "clock" "clock#simpleclock" "tray" "custom/power"];

                "custom/hello-from-waybar" = {
                format = "{}";
                max-length = 40;
                interval = "once";
                exec = pkgs.writeShellScript "hello-from-waybar" '' echo "OwO" '';
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
                format = "  {:%H:%M}";
                };
                "clock" = {
                format = "  {:%a %d %b}";
                tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                };
                "cpu" = {
                format = "  {usage}%";
                tooltip = true;
                interval = 1;
                };
                "temperature" = {
                format = "  {temperatureC}°C";
                tooltip = true;
                interval = 1;
                };
                "memory" = {
                format = "  {used:0.2f}G";
                };
                "pulseaudio" = {
                format = "{icon} {volume}%";
                format-muted = "  muted";
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
            };
        };

    style = ''
    * {
  min-height: 0;
  font-family: Lexend, "Font JetBrainsMono 6 Free Solid";
  font-size: 16px;
  font-weight: 500;
}

window#waybar {
  transition-property: background-color;
  transition-duration: 0.5s;
  /* background-color: #1e1e2e; */
  /* background-color: #181825; */
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
  color: #cdd674;
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
#custom-spotify,
#cpu,
#tray,
#memory,
#temperature,
#window {
  min-height: 0;
  padding: 2px 10px;
  border-radius: 8px;
  margin: 4px 4px;
  background-color: #181825;
}

#custom-sep {
  padding: 0px;
  color: #585b70;
}

window#waybar.empty #window {
  background-color: transparent;
}

#cpu {
  color: #94e2d5;
}

#temperature {
    color: #94e2d5;
}

#memory {
  color: #cba6f7;
}

#clock {
  color: #74c7ec;
}

#clock.simpleclock {
  color: #89b4fa;
}

#window {
  color: #a6e3a1;
}

#pulseaudio {
  color: #b4befe;
}

#pulseaudio.muted {
  color: #a6adc8;
}

#custom-logo {
  color: #89b4fa;
}

#custom-power {
  color: #f38ba8;
  padding-right: 5px;
  font-size: 14px;
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

    programs.wofi = {
        enable = true;
        settings = {
            location = "bottom-left";
            allow_markup = true;
            width = 250;
        };
        style = ''
        window {
  margin: 0px;
  border: 5px solid #111019;
  background-color: rgba(11, 10, 16, 0.9);
  border-radius: 15px;
}

#input {
  all: unset;
  min-height: 36px;
  padding: 4px 10px;
  margin: 4px;
  border: none;
  color: #e2e0ec;
  font-weight: bold;
  background-color: #161420;
  outline: none;
  border-radius: 15px;
  margin: 10px;
  margin-bottom: 2px;
}

#inner-box {
  margin: 4px;
  padding: 10px;
  font-weight: bold;
  border-radius: 15px;
}

#outer-box {
  margin: 0px;
  padding: 3px;
  border: none;
  border-radius: 15px;
  border: 5px solid #111019;
}

#scroll {
  margin-top: 5px;
  border: none;
  border-radius: 15px;
  margin-bottom: 5px;
}

#text:selected {
  color: #f1f0f5;
  margin: 0px 0px;
  border: none;
  border-radius: 15px;
}

#entry {
  margin: 0px 0px;
  border: none;
  border-radius: 15px;
  background-color: transparent;
}

#entry:selected {
  margin: 0px 0px;
  border: none;
  border-radius: 15px;
  background: linear-gradient(90deg, #E97193 0%, #74c7ec 100%);
}
        '';
    };

    

	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
}


