{ config, pkgs, lib, ... }: {
  imports = [
        
  ];


  environment.systemPackages = with pkgs; [
    swaybg
    swaylock
    swayidle
    wofi
    grimblast
    kitty
    foot
  ];

  # make some environment tweaks for wayland
  environment.sessionVariables = {
    GDK_BACKEND = "wayland,x11";
    # some nixpkgs modules have wrapers
    # that force electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    # make qt apps expect wayland
    QT_QPA_PLATFORM = "wayland";
    # set backend for sdl
    SDL_VIDEODRIVER = "wayland";
    # fix modals from being attached on tiling wms
    _JAVA_AWT_WM_NONREPARENTING = "1";
    # fix java gui antialiasing
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
    # firefox and mozilla software expect wayland
    MOZ_ENABLE_WAYLAND = "1";
  };
}
