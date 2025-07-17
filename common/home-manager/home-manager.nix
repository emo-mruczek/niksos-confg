{inputs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.felix = import ./home.nix;
    extraSpecialArgs = {
      inherit inputs;
    };
  };
}
