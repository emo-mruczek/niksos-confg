{pkgs, ...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      # u = "nixos-rebuild switch --flake \"/home/felix/niksos-confg\" -L --sudo";
      u = "nh os switch";
      t = "trash -v";
      n = "nvim";
      sn = "shutdown now";
      gp = "git pull";
      sus = "systemctl suspend";
      fuck = "nix flake update";
      ass = "add";
      kys = "shutdown now";
      woman = "man";
      person = "man";
      feline = "cat";
      kik = "sudo openconnect --protocol=gp vpn.student.pwr.edu.pl -b";
      slu = "systemctl --user restart pipewire";
      mnt = "udisksctl mount -b";
      umnt = "udisksctl unmount -b";
      ":q" = "exit";
    };
    initExtra = ''
      gg () {
        git add .
        git commit -m "$1"
        git push
      }
      cht () {
        curl cheat.sh/$1
      }

      source ${pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/lincheney/fzf-tab-completion/4850357beac6f8e37b66bd78ccf90008ea3de40b/bash/fzf-bash-completion.sh";
        hash = "sha256-CvrgwkVcDBoIsb4CIJtPDdCE+Xw01EGNpfGpENzWvCw=";
      }}
      bind -x '"\t": fzf_bash_completion'

      export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
    '';
  };
}
