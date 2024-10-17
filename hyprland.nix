{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # nvidiaPatches = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
