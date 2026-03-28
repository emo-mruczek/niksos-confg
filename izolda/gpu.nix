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
      # package =
      #   config.boot.kernelPackages.nvidiaPackages.latest
      #   // {
      #     open = config.boot.kernelPackages.nvidiaPackages.latest.open.overrideAttrs (
      #       old: {
      #         patches =
      #           (old.patches or [])
      #           ++ (let
      #             cachyos-nvidia-patch = pkgs.fetchpatch {
      #               url = "https://raw.githubusercontent.com/CachyOS/CachyOS-PKGBUILDS/master/nvidia/nvidia-utils/kernel-6.19.patch";
      #               sha256 = "sha256-YuJjSUXE6jYSuZySYGnWSNG5sfVei7vvxDcHx3K+IN4=";
      #             };
      #           in [cachyos-nvidia-patch]);
      #       }
      #     );
      #   };
      #
      package = config.boot.kernelPackages.nvidiaPackages.latest;
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
