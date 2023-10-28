{ config, pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [
    swaybg
    swaylock
    swayidle
    wofi
    waybar
    kitty
    foot
    mako
    nerdfonts
    iosevka
    noto-fonts
    font-awesome
  ];

}
