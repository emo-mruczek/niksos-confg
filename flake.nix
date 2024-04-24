{
	description = "Niksos flake VERY N00B DO NOT RECCOMEND";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

		hyprland = {
		url = "github:hyprwm/Hyprland";
		inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
		url = "github:nix-community/home-manager/release-23.11";
		inputs.nixpkgs.follows = "nixpkgs";
		};

	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
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

				home-manager.nixosModules.home-manager {
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;

				home-manager.users.felix = import ./home.nix;
				}
			];
		};
	};
	};
}
