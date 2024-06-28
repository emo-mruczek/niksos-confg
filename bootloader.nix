{
  pkgs,
  ...
}: {
  # Bootloader.

  boot = {
  loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  initrd.systemd.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  # boot.loader.timeout = 2;
  # boot.initrd.enable = true;
  boot.plymouth = {
    enable = false;
    font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    themePackages = [pkgs.catppuccin-plymouth];
    theme = "catppuccin-macchiato";
  };
}
