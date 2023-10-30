{ pkgs, config, ...}: {
 environment.systemPackages = with pkgs; [
    btop
    cava
    wireplumber
    brightnessctl
    pywal
  ];

}
