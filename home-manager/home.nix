{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # nix-colors.homeManagerModules.default
    ./wayland
    ./wm
    ./base
    ./pkgs
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "aki";
    homeDirectory = "/home/aki";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  
  home.packages = with pkgs; [ helix vscode firefox zip unzip nerdfonts iosevka ];

  # Enable home-manager and git
    programs.home-manager.enable = true;
    programs.git = {
      enable = true;
      userName = "Andreas Taenzer";
      userEmail = "andreast.work@gmail.com";
    };

  # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
