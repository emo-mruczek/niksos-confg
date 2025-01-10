{...}: {
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
      fuck = "nix flake update";
      ass = "add";
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
