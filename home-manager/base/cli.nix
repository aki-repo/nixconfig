{ pkgs, config, ...}: {
 home.packages = with pkgs; [
    btop
    cava
    pamixer
  ];

}