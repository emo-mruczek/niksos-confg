{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [];

  # Some shit for nvidia that i need to take care of
  hardware.opengl.extraPackages = with pkgs; [];

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDrivers = ["nvidia" "amdgpu"];
  # services.xserver.videoDrivers = ["nvidia"];
  #services.xserver.displayManager.setupCommands;
  hardware.nvidia.prime = {
    # Make sure to use the correct Bus ID values for your system!
    amdgpuBusId = "PCI:65:0:0";
    nvidiaBusId = "PCI:01:0:0";
    #allowExternalGpu = false;
    #reverseSync.enable = true;
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
  };
  #    hardware.nvidia.open = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.powerManagement.enable = true;
  
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
