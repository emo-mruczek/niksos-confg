{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [kanata];

  services.kanata = {
    enable = lib.mkDefault true;
    keyboards = {
      izolda.configFile = ./kolemak.kbd;
    };
  };
}
