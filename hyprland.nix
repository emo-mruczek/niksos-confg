{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland.override {
    #   aquamarine = pkgs.aquamarine.overrideAttrs {
    #     src = pkgs.fetchFromGitHub {
    #       owner = "hyprwm";
    #       repo = "aquamarine";
    #       rev = "2ff06343aa9738adad981aec2fdb21d4d56e3fb9";
    #       hash = "sha256-9tnlGx4txEjOqsVkj8AEpEGq1+6OeZebhPsukZBB7Gc=";
    #     };
    #   };
    # };
  };
}
