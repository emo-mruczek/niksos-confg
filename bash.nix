 { config, pkgs, lib, ...} : {
programs.bash = {
	enable = true;
	enableCompletion = true;
    shellAliases = {
        u = "nixos-rebuild switch --flake \"/home/felix/nixos-config\" -L --use-remote-sudo";
    };
    initExtra = ''
    gg () {
    git add .
    git commit -m "$1"
    git push
    } 
    '';
	};
 }
