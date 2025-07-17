{ ... }: {
  programs.direnv = {
    nix-direnv.enable = true;
    enable = true;
  };
}
