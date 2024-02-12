{pkgs}:
pkgs.stdenv.mkDerivation {
	name = "everforest";
	src = pkgs.fetchFromGitHub {
		owner = "Fausto-Korpsvart";
    		repo = "Everforest-GTK-Theme";	
		rev = "8481714cf9ed5148694f1916ceba8fe21e14937b";
		hash = "sha256-NO12ku8wnW/qMHKxi5TL/dqBxH0+cZbe+fU0iicb9JU=";
	};
	dontUnpack=true;
	dontBuild=true;
	installPhase = ''
		mkdir -p $out/share/themes
		mkdir -p $out/share/icons
		cp -a $src/themes/* $out/share/themes
		cp -a $src/icons/* $out/share/icons
	'';
}
