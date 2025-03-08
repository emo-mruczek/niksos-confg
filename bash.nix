{...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      u = "nixos-rebuild switch --flake \"/home/felix/niksos-confg\" -L --use-remote-sudo";
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
