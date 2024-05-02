{ pkgs, config, ... }:
{
	environment.systemPackages = with pkgs; [ ];
	
  	# Some shit for nvidia that i need to take care of
	hardware.opengl.extraPackages = with pkgs; [  ];

	hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
 	hardware.nvidia.modesetting.enable = true;
 	services.xserver.videoDrivers = [ "nvidia" "amdgpu"]; 
	hardware.nvidia.prime = { 
		# Make sure to use the correct Bus ID values for your system!
		  amdgpuBusId = "PCI:65:00.0";
		  nvidiaBusId = "PCI:01:00.0";
	};
#    hardware.nvidia.open = true;
	hardware.nvidia.nvidiaSettings = true;
	hardware.nvidia.powerManagement.enable = false;
	hardware.opengl = {
    		enable = true;
    		driSupport = true;
    		driSupport32Bit = true;
 	};
  
}
