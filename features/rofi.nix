{config, lib, pkgs, ...}:
{
	home.packages = [
		pkgs.rofi-wayland
	];
	home.file.".config/rofi/everforest.rasi".text=builtins.readFile ./theme/everforest.rasi;
	home.file.".config/rofi/config.rasi".text=''
	@import "everforest.rasi"
	'';


}
