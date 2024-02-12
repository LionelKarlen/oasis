{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    style = ''

    ${builtins.readFile "${pkgs.waybar}/etc/xdg/waybar/style.css"}
      window#waybar {
        background: #''+config.colorScheme.palette.base00+'';
        border-bottom: none;
      }

      * {
        font-size: 12px;
	background: transparent;
      }
      button {
    border: none;
    border-radius: 0;
}

button:hover {
    transition-duration: .1s;
    background: inherit;
    box-shadow: inset 0 -3px #''+config.colorScheme.palette.base05+'';
}

#workspaces button {
    color: #''+config.colorScheme.palette.base03+'';
}

#clock, #pulseaudio, #tray {
background: transparent;
color: #''+config.colorScheme.palette.base03+'';
}


#workspaces button.active {
    color: #''+config.colorScheme.palette.base05+'';
}

    '';
    settings = [{
      height = 20;
      layer = "top";
      position = "top";
      tray = { spacing = 10; };
      modules-center = [ ];
      modules-left = [ "hyprland/workspaces" ];
      modules-right = [
      	"clock"
	"tray"
      ];
      battery = {
        format = "{capacity}% {icon}";
        format-alt = "{time} {icon}";
        format-charging = "{capacity}% ";
        format-icons = [ "" "" "" "" "" ];
        format-plugged = "{capacity}% ";
        states = {
          critical = 15;
          warning = 30;
        };
      };
      clock = {
      	format = "{:%d-%m-%Y %H:%M}";
        tooltip-format = "{:%Y-%m-%d | %H:%M}";
      };
      cpu = {
        format = "{usage}% ";
        tooltip = false;
      };
      memory = { format = "{}% "; };
      network = {
        interval = 1;
        format-alt = "{ifname}: {ipaddr}/{cidr}";
        format-disconnected = "Disconnected ⚠";
        format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
        format-linked = "{ifname} (No IP) ";
        format-wifi = "{essid} ({signalStrength}%) ";
      };
      pulseaudio = {
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-icons = {
          car = "";
          default = [ "" "" "" ];
          handsfree = "";
          headphones = "";
          headset = "";
          phone = "";
          portable = "";
        };
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        on-click = "pavucontrol";
      };
      "sway/mode" = { format = ''<span style="italic">{}</span>''; };
      temperature = {
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = [ "" "" "" ];
      };
    }];
  };
}
