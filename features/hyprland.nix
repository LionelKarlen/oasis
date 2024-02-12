{config, lib, pkgs, ...}:

{
	home.packages= [
#		(pkgs.waybar.overrideAttrs (oldAttrs: {mesonFlags=oldAttrs.mesonFlags++["-Dexperimental=true"];}))
		pkgs.xwayland
		pkgs.swww
		pkgs.networkmanagerapplet
		pkgs.nerdfonts
	];	

	wayland.windowManager.hyprland = {
		enable=true;
		plugins = [];
		settings = {
			monitor=[
				",2560x1440,auto,1"
			];
			input = {
				kb_layout="ch";
				kb_variant="de";
				follow_mouse=1;
				touchpad = {
					natural_scroll="no";
				};
			};
			general = {
				border_size=3;
				gaps_in = 3;
				gaps_out = 5;
				layout="dwindle";
				allow_tearing=false;
				"col.active_border"="0xff${config.colorScheme.palette.base0D}";
				"col.inactive_border"="0xff${config.colorScheme.palette.base00}";
			};
			decoration= {
				rounding=0;
				blur.enabled=false;
				drop_shadow="no";
			};
			animations = {
				enabled="yes";
				bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
				animation = [
					"windows, 1, 4, myBezier"
					"windowsOut, 1,4, default, popin 80%"
					"border, 1, 4 ,default"
					"borderangle,1,4,default"
					"fade,1,4,default"
					"workspaces,1,4,default"
				];
			};
			dwindle = {
				pseudotile="yes";
				preserve_split="yes";
			};
			master = {
				new_is_master=true;		
			};
			gestures = {
				workspace_swipe="off";
			};
			misc = {
				force_default_wallpaper=0;
			};
			"$mainMod"="ALT";
			bind = [
				# hotkeys
				"$mainMod, T, exec, foot"
				"$mainMod, RETURN, exec, foot"
				"$mainMod, B, exec, firefox"
				"$mainMod, E, exec, dolphin"
				"$mainMod, R, exec, rofi -show drun"
				"$mainMod, M, exit," # exit hyprland
				"$mainMod, Q, killactive," # close current 
				"$mainMod, V, togglefloating," # float current
				"$mainMod, U, togglesplit," # toggle split mode
				"$mainMod, P, pseudo," 


				# focus
				"$mainMod, h, movefocus, l"
				"$mainMod, l, movefocus, r"
				"$mainMod, k, movefocus, u"
				"$mainMod, j, movefocus, d"
				"$mainMod SHIFT, h, movewindow, l"
				"$mainMod SHIFT, l, movewindow, r"
				"$mainMod SHIFT, k, movewindow, u"
				"$mainMod SHIFT, j, movewindow, d"
				
				# workspaces
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"

				# scratchpad
				"$mainMod, S, togglespecialworkspace, magic"
				"$mainMod SHIFT, S, movetoworkspace, special:magic"

				# scroll with mainMod + scroll
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
				
				# show clipboard history
				"$mainMod SHIFT, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
			];
			bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];
			exec-once = [
				"wl-paste --type text --watch cliphist store"
				"wl-paste --type image --watch cliphist store"
				"notify-send ${config.gtk.cursorTheme.name}"
				"hyprctl setcursor ${config.gtk.cursorTheme.name} 24"
				"bash ~/.oasis/features/startup.sh"
			];
		};
		extraConfig = ''



		'';
	};
}


