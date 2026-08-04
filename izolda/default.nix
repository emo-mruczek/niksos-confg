_: {
  imports = [
    ./hardware-configuration.nix
    ./gpu.nix
    ./networking.nix
    ./configuration.nix
  ];

  home-manager.users.felix = import ./home-manager;
}
