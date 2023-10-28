{ config, pkgs, lib, nur, ... }: {

  programs.firefox = {
    enable = true;
    profiles."aki"  = {
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    darkreader
    bypass-paywalls-clean
    bitwarden
    ];
    };
  };
}
