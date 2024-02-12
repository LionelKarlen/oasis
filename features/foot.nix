{config,lib, pkgs, ...}:
{
	home.packages=[
		pkgs.foot
		pkgs.starship
	];
	programs.starship = {
		enable=true;	
		settings = {
			add_newline = false;

      			character = {
      				success_symbol = "[>](bold green)";
      				error_symbol = "[>](bold red)";
      			};
		};

	};
	programs.foot = {
		enable=true;	
		settings = {
			main = {
				font="monospace:size=11";
				pad="10x10";
			};
			colors = {
				background="${config.colorScheme.palette.base00}";
				foreground="${config.colorScheme.palette.base05}";

				# regular0 black
				# regular1 red
				# regular2 green
				# regular3 yellow
				# regular4 blue
				# regular5 magenta
				# regular6 cyan
				# regular7 white

				regular0="${config.colorScheme.palette.base02}"; 
				regular1="${config.colorScheme.palette.base0E}";
				regular2="${config.colorScheme.palette.base0D}";
				regular3="${config.colorScheme.palette.base0A}"; 
				regular4="${config.colorScheme.palette.base08}";
				regular5="${config.colorScheme.palette.base09}";
				regular6="${config.colorScheme.palette.base0B}";
				regular7="${config.colorScheme.palette.base05}";

				bright0="${config.colorScheme.palette.base02}"; 
				bright1="${config.colorScheme.palette.base0E}";
				bright2="${config.colorScheme.palette.base0D}";
				bright3="${config.colorScheme.palette.base0A}"; 
				bright4="${config.colorScheme.palette.base08}";
				bright5="${config.colorScheme.palette.base09}";
				bright6="${config.colorScheme.palette.base0B}";
				bright7="${config.colorScheme.palette.base05}";

			};
		};
	};	
}
