{pkgs}:
pkgs.stdenv.mkDerivation {
	name="BreezeX-Dark";
	src = pkgs.fetchurl {
		url = "https://github.com/ful1e5/BreezeX_Cursor/releases/download/v2.0.0/BreezeX-Dark.tar.gz";
		sha256="0fw5c44zlfqhpx0wcg1az4kx7w20fjvdd9wibmr6h5cql815sk4y";
	};
	dontUnpack=true;
	installPhase = ''
		mkdir -p $out/share/icons
		${pkgs.gnutar}/bin/tar -xvf $src -C $out/share/icons/
	'';
}
