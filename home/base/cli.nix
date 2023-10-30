{ pkgs, config, ...}: {
 home.packages = with pkgs; [
    btop
    cava
    wireplumber
    brightnessctl
    moc
  ];

}
