{ inputs, lib, config, pkgs, ... }: {

imports = [
    #inputs.hyprland.homeManagerModules.default
    ./config.nix
  ];


home.packages = with pkgs; [
  inputs.hyprland-contrib.grimblast
  inputs.hyprland.xdg-desktop-portal-hyprland
  inputs.hyprland.hyprland-waybar
];

wayland.windowManager.hyprland = {
  enable = true;
  xwayland.enable = true;
  enableNvidiaPatches = true;
  package = pkgs.hyprland;
  recommendedEnvironment = true;
  systemdIntegration = true;

};  


}
