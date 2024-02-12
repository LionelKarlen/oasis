{config, pkgs, lib, ...}:
{
	home.packages=[
		pkgs.swaylock
	];
	programs.swaylock = {
		enable=true;
		settings = {
			color="${config.colorScheme.palette.base00}";
			indicator-radius=100;
			inside-color="${config.colorScheme.palette.base01}";
			ring-color="${config.colorScheme.palette.base0D}";
			indicator-thickness=3;
			line-color="00000000";
			text-color="${config.colorScheme.palette.base05}";
		};
	};
}
