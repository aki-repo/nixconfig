
{ config, pkgs, nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

  programs = {
    kitty = {
      enable = true;
      settings = {
        foreground = "#${config.colorScheme.colors.base05}";
        background = "#${config.colorScheme.colors.base00}";
        # ...
      };
    };
    
    qutebrowser = {
      enable = true;
      settings ={
        colors = {
          # Becomes either 'dark' or 'light', based on your colors!
          webppage.preferred_color_scheme = "${config.colorScheme.kind}";
          tabs.bar.bg = "#${config.colorScheme.colors.base00}";
          keyhint.fg = "#${config.colorScheme.colors.base05}";
          # ...
        };
      };
    };

    foot = {
      enable = true;
      settings = {
        main = {
          font = "monospace:size=12";
        };
        colors = {
          foreground = "${config.colorScheme.colors.base05}";
          background = "${config.colorScheme.colors.base00}";
          regular0 = "${config.colorScheme.colors.base02}";
        };
      };
    };
    
  };
}