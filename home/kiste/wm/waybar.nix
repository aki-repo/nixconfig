{ config, pkgs, nix-colors, ... }: {



programs.waybar = {
  enable = true;
  settings = 
  {
  mainBar = {
    layer = "top";
    position = "top";
    height = 30;
    output = [
      "eDP-1"
      #"HDMI-A-1"
    ];
    modules-left = [ "hyprland/workspaces" "sway/mode" "wlr/taskbar" ];
    modules-center = [ "clock" ];
    modules-right = [ "pulseaudio" "network" "temperature" "battery" ];

    "hyprland/workspaces" = {
      all-outputs = true;
    };


    "sway/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
    };

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
      format-muted = " {format_source}";
      format-source = "{volume}% ";
      format-source-muted = "";
      format-icons = {
        headphones = "";
        handsfree = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = [ "" "" "" ];
      };

     battery = {
      states = {
        good = 90;
        warning = 30;
        critical = 15;
      };
      format = "{capacity}% {icon}";
      format-charging = "{capacity}% ";
      format-plugged = "{capacity}% ";
      format-alt = "{time} {icon}";
      format-icons = [ "" "" "" "" "" ];
      };
    }; 
  };
  };
};
}
