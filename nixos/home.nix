{ config, pkgs, ...}:

{
	home.username = "felix";
	home.homeDirectory = "/home/felix";

	home.packages = with pkgs; [
	firefox
        kate
	tree
	gparted
#	neovim   in configuration.nix already
	gcc
	gnumake
	librewolf
	signal-desktop
	hashcat
 	btop
 	mesa-demos
	unzip
	zip
	git
	neofetch
	kitty
	haveged
# thunderbird
	wireshark
	inetutils
	rocmPackages.llvm.clang-unwrapped
	python3
	libsodium
	rocmPackages.rocgdb
	nodejs_21
	gnuplot_qt
	p3x-onenote
	steam
	];

	programs.git = {
	enable = true;
	userName = "emo-mruczek";
	userEmail = "krokcia1@gmail.com";
	};

	programs.bash = {
	enable = true;
	enableCompletion = true;
	};

	home.stateVersion = "23.11";

	programs.home-manager.enable = true;
	}


