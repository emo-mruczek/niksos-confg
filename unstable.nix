{ inputs, pkgs, ...}: {
  imports = [inputs.nixpkgs-small];
  environment.systemPackages = with pkgs; [
    calibre
  ];
}
