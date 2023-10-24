{ inputs, lib, config, pkgs, ... }: {

imports = [
    #../common
    #../common/wayland-wm
    inputs.hyprland.homeManagerModules.default
    ./config.nix
  ];


home.packages = with pkgs; [
  #inputs.hyprland.packages.${system}.grimblast
  swaybg
  hyprpaper 
  inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland
  foot
  kitty
  swayidle
  swaylock
  waybar
  # inputs.hyprland.packages.${system}.hyprland-waybar
];

wayland.windowManager.hyprland = {
  enable = true;
  xwayland = {
    enable = true;
  };
  enableNvidiaPatches = true;
  #package = pkgs.inputs.hyperland.hyperland;
  systemdIntegration = true;

};  


}
