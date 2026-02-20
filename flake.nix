{
  description = "Im cooking this stuff with a help of poz (poz.pet)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-small.url = "github:NixOS/nixpkgs/nixos-unstable-small";

    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
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
    flake-parts,
    ...
  } @ inputs: 
  flake-parts.lib.mkFlake { inherit inputs; } {
    debug = false;
    systems = ["x86_64-linux"];
    flake = {
    nixosConfigurations = {
      izolda = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./common
          ./izolda

          inputs.home-manager.nixosModules.home-manager
        ];
      };
      izaura = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./common
          ./izaura

          inputs.home-manager.nixosModules.home-manager
        ];
      };
      izyda = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./common
          ./izyda

          inputs.nixosModules.home-manager
          inputs.mango.nixosModules.mango
        ];
      };
    };
    };
  };
}
