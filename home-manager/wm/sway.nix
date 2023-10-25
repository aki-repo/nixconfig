{ inputs, lib, config, pkgs, ... }: {

wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty"; 
      menu = "wofi --show drun";
      keybindings =
        let
          pamixer = "${pamixer}";
          playerctl = "${pkgs.playerctl}/bin/playerctl";
        in
        lib.mkOptionDefault {
          "${modifier}+q" = "kill";
          "${modifier}+Shift+q" = "exit";

          # audio keys
          XF86AudioMute = "exec pamixer -t";
          XF86AudioLowerVolume = "exec pamixer -d 5";
          XF86AudioRaiseVolume = "exec pamixer -i 5";
          XF86AudioMicMute = "exec pamixer -m";

          # media keys
          XF86AudioPlay = "exec ${playerctl} play-pause";
          XF86AudioPause = "exec ${playerctl} play-pause";
          XF86AudioNext = "exec ${playerctl} next";
          XF86AudioPrev = "exec ${playerctl} previous";

          # brightness
          "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
          "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        };
    };
      gaps = {
        inner = 10;
        outer = 20;
      };
    };
}
