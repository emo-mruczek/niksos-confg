_: {
  security.rtkit.enable = true;
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      wireplumber.extraConfig = {
        "profiles" = {
          "main" = {
            "monitor.libcamera" = "disabled";
          };
        };
      };
    };
  };
}
