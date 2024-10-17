{
  description = "Niksos flake VERY N00B DO NOT RECOMMEND";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    neovim-overlay.url = "github:nix-community/neovim-nightly-overlay";

    nvf = {
      url = "github:notashelf/nvf/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.neovim-overlay.follows = "neovim-overlay";
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
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      izolda = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          ./apps.nix
          ./audio.nix
          ./bootloader.nix
          ./gpu.nix
          ./hardware-configuration.nix
          ./programming.nix
          ./system-utils.nix
          ./timezone.nix
          ./hyprland.nix
          ./nvf.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.felix = import ./home.nix;
          }
        ];
      };
    };
  };
}
