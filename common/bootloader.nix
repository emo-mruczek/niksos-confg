{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_xanmod; # TODO: change to lastest after fix

    plymouth = {
      enable = true;
      themePackages = [pkgs.catppuccin-plymouth pkgs.plymouth-blahaj-theme];
      theme = "blahaj";
      logo = pkgs.callPackage ./packages/splash.nix {};
    };

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    loader.timeout = 0;
  };
}
