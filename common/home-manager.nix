_: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.felix = import ./home.nix;
  };
}
