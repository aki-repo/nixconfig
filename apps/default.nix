{ config, pkgs, lib, ... }: {
  imports = [
    ./wayland
    ./cli.nix
  ];
  programs.firefox.enable = true;
}