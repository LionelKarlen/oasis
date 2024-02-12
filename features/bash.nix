{config, lib, pkgs, ...}:

{
	programs.bash = {
		enable=true;
		shellAliases = {
			la = "ls -a";
			".." = "cd ..";
		};
	};
}
