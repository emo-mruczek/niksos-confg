{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [];

  hardware = {
    graphics = {
      extraPackages = with pkgs; [];
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      open = true;
      nvidiaSettings = true;
      powerManagement.enable = true;
      modesetting.enable = true;
      prime = {
        amdgpuBusId = "PCI:65:0:0";
        nvidiaBusId = "PCI:01:0:0";
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
  };
  services.xserver.videoDrivers = ["nvidia" "amdgpu"];
}
