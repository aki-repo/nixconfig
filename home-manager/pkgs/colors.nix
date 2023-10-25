
{ config, pkgs, nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.gruvbox-light-soft;

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
    
  };
}