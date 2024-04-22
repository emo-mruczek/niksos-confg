{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		tree
		gparted
		neovim
		hashcat
		btop
		mesa-demos # demos for 3D
		unzip
		zip
		git
		neofetch
		kitty
		haveged # entropy
		wireshark
		inetutils # somethig for networking
		wl-clipboard # for clipboard
		neovim
		#plymouth
		dig
		# for hyprland
		swww
        waybar
        wofi


        lolcat
	];
}
