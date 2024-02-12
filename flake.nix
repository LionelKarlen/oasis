{
	description="Oasis Update flake";
	inputs={
		nixpkgs.url="nixpkgs/nixos-23.11";
		home-manager.url="github:nix-community/home-manager/release-23.11";
		home-manager.inputs.nixpkgs.follows="nixpkgs";
		nix-colors.url="github:misterio77/nix-colors";
	};
	outputs={self, nixpkgs, home-manager, nix-colors, ...}:
	let
		system="x86_64-linux";
		pkgs=nixpkgs.legacyPackages.${system};

	in {
		nixosConfigurations = {
			oasis = nixpkgs.lib.nixosSystem {
				inherit system;
				modules = [./configuration.nix];
			};
		};
		homeConfigurations = {
			lionel = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;	
				modules =[./home.nix];
				extraSpecialArgs={inherit nix-colors;};
			};
		};
	};
}
