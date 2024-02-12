{config, lib, pkgs,...}:
{
	home.packages = [
		pkgs.cliphist
		pkgs.wl-clipboard
	];

	services.cliphist = {
		enable=true;
	};
}
