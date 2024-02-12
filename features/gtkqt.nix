{config, lib, pkgs,...}:
let 
	BreezeX = import ./theme/BreezeX.nix {inherit pkgs;};
	everforest = import ./theme/everforest.nix {inherit pkgs;};
in {
	home.packages = [
		pkgs.qt5ct
	];

	qt = {
		enable=true;
		platformTheme = "qtct";
		style = {
			name = "kvantum";
		};
	};

	home.sessionVariables = {
		"QT_STYLE_OVERRIDE"="kvantum";
	};

	gtk = {
		enable=true;
		cursorTheme = {
			name = "BreezeX-Dark";
			package = BreezeX;
		};
		theme = {
			package = everforest;
			name = "everforest";
		};
	};

	home.file.".icons/bibata".source="${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Clasic";

	xdg.configFile = {
		"Kvantum/kvantum.kvconfig".text=''
			[General]
			theme=GraphiteNordDark
		'';
		"Kvantum/GraphiteNord".source = "${pkgs.graphite-kde-theme}/share/Kvantum/GraphiteNord";
	};
}
