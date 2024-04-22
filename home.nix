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
    };
	};
    
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "bottom";
                position = "top";
                modules-left = [ "hyprland/workspaces" "hyprland/mode" "hyprland/taskbar"];
                modules-center = [ "hyprland/window" "custom/hello-from-waybar"];
                modules-right = [ "mpd" "temperature"];

                "custom/hello-from-waybar" = {
                format = "hello {}";
                max-length = 40;
                interval = "once";
                exec = pkgs.writeShellScript "hello-from-waybar" '' echo "dupa" '';
                };
            };
        };
    };

	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
	}


