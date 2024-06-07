{
  pkgs,
  config,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [];

  # Some shit for nvidia that i need to take care of
  hardware.opengl.extraPackages = with pkgs; [];

  #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    version = "555.42.02";
    sha256_64bit = "sha256-k7cI3ZDlKp4mT46jMkLaIrc2YUx1lh1wj/J4SVSHWyk=";
    sha256_aarch64 = lib.fakeSha256;
    openSha256 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA=";
    settingsSha256 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA=";
    persistencedSha256 = lib.fakeSha256;
  };
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
