{ config, pkgs, lib, ... }: {
  imports = [
        
  ];
home.pointerCursor = {
  gtk.enable = true;
  package = pkgs.bibata-cursors;
  name = "Bibata-Modern-Ice";
  size = 22;
};

  home.packages = with pkgs; [
    swaybg
    swaylock
    swayidle
    wofi
  ];

  # make some environment tweaks for wayland
  home.sessionVariables = {
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
