{config, pkgs, lib, ...}:
{
	home.packages = [
		pkgs.pavucontrol
		pkgs.pipewire
	];	

	sound.enable=true;
	services.pipewire={
		enable=true;
		alsa.enable=true;
		alsa.support32Bit=true;
		pulse.enable=true;
		jack.enable=true;
	};
}
