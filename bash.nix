{
  ...
}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      u = "nixos-rebuild switch --flake \"/home/felix/niksos-confg\" -L --use-remote-sudo";
      t = "trash";
      n = "nvim";
      sn = "shutdown now";
      gp = "git pull";
      sus = "systemctl suspend";
      kik = "sudo openconnect --protocol=gp vpn.student.pwr.edu.pl -b";
      slu = "systemctl --user restart pipewire";
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
