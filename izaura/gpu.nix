{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [];
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [];
    };

    nvidia = {
      open = true;
      nvidiaSettings = true;
      powerManagement.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      modesetting.enable = true;
    };
  };
}
