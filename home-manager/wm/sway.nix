{ inputs, lib, config, pkgs, ... }: {

wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty"; 
      menu = "wofi --show drun";
      keybindings =
        let
          pactl = "${pkgs.pulseaudio}/bin/pactl";
          playerctl = "${pkgs.playerctl}/bin/playerctl";
        in
        lib.mkOptionDefault {
          "${modifier}+q" = "exec killactive";
          "${modifier}+Shift+q" = "exec exit";

          # audio keys
          XF86AudioMute = "exec ${pactl} set-sink-mute 0 toggle";
          XF86AudioLowerVolume = "exec ${pactl} set-sink-volume 0 -5%";
          XF86AudioRaiseVolume = "exec ${pactl} set-sink-volume 0 +5%";
          XF86AudioMicMute = "exec ${pactl} set-source-mute 0 toggle";

          # media keys
          XF86AudioPlay = "exec ${playerctl} play-pause";
          XF86AudioPause = "exec ${playerctl} play-pause";
          XF86AudioNext = "exec ${playerctl} next";
          XF86AudioPrev = "exec ${playerctl} previous";
        };

    };
  };


}