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
        brightnessctl
        pavucontrol
        networkmanagerapplet
        pkg-configUpstream
        openssl_3_1
		#plymouth
		dig
        wev
		# for hyprland
		swww
        waybar
        wofi
        mako
        grim
        slurp


        font-awesome
        lolcat
        jetbrains-mono
	];
}
