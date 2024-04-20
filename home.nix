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
	};

	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
	}


