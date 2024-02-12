{config, lib, pkgs, ...}:
{
	home.packages = with pkgs; [
		freetube
		gnome.nautilus
		ranger
		imv
		zathura
	];
}
