{ config, pkgs, ... }: {
  imports = [
    ./wayland.nix
    ./editors.nix
    ./cli.nix
    ./web.nix
  ];
}
