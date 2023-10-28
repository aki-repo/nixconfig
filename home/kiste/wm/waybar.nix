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
      "HDMI-A-1"
    ];
    modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
    modules-center = [ "clock" ];
    modules-right = [ "temperature" "tray" ];

    "sway/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
    };
    
    };
  };
};

}
