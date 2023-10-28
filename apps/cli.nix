{ config, pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [
    btop
    neofetch
    cava
    moc
    pywal
  ];

}
