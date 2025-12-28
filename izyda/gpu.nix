{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [];
    };

  };
}
