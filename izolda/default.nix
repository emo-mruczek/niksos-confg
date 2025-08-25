_ : {
  imports = [
    ./hardware-configuration.nix
    ./gpu.nix
    ./networking.nix

  ];

  home-manager.users.felix = import ./home-manager;
}
