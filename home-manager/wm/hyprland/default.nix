{ inputs, lib, config, pkgs, ... }: {

imports = [
    inputs.hyprland.homeManagerModules.default
    ./config.nix
  ];


home.packages = with pkgs; [
  #inputs.hyprland.packages.${system}.grimblast
  #inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland
  #inputs.hyprland.packages.${system}.hyprland-waybar
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
