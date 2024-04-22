{ pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		p3x-onenote
		firefox
		kate
		librewolf
		signal-desktop
		steam
		gimp
		thunderbird
		libreoffice-qt
        dwarf-fortress
	];
}
