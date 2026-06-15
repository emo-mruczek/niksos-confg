{
  description = "Im cooking this stuff with a help of poz (poz.pet)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-small.url = "github:NixOS/nixpkgs/nixos-unstable-small";

    mango = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixpkgs-small,
    mango,
    ...
  } @ inputs: 
    { 
    nixosConfigurations = {
      izolda = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./common
          ./izolda

         home-manager.nixosModules.home-manager
          mango.nixosModules.mango
        ];
      };
      izaura = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./common
          ./izaura

          home-manager.nixosModules.home-manager
          mango.nixosModules.mango
        ];
      };
      izyda = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./common
          ./izyda

          home-manager.nixosModules.home-manager
          mango.nixosModules.mango
        ];
      };
    };
  };
}
