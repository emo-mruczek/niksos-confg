{...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      u = "nixos-rebuild switch --flake \"/home/felix/niksos-confg\" -L --sudo";
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
    '';
  };
}
