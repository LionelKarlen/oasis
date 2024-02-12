{config, pkgs, lib, ...}:
{
	home.packages=[
		pkgs.mako
		pkgs.libnotify
	];

	services.mako = {
		enable=true;
		anchor="top-right";
		borderColor="#${config.colorScheme.palette.base0D}";
		backgroundColor="#${config.colorScheme.palette.base01}";
		defaultTimeout=4000;
		borderSize=2;
	};

}
