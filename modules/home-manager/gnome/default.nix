{
  config,
  lib,
  nhModules,
  pkgs,
  ...
}:
with lib.hm.gvariant; {
  imports = [
    "${nhModules}/misc/gtk"
    "${nhModules}/misc/wallpaper"
    "${nhModules}/misc/xdg"
    "${nhModules}/services/flameshot"
  ];

  # Ensure Gnome extensions installed
  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
  ];

  dconf.settings = {
    "org/gnome/calculator" = {
      "accuracy" = 9;
      "angle-units" = "degrees";
      "base" = 10;
      "button-mode" = "basic";
      "number-format" = "automatic";
      "show-thousands" = false;
      "show-zeroes" = false;
      "source-currency" = "";
      "source-units" = "degree";
      "target-currency" = "";
      "target-units" = "radian";
      "window-maximized" = false;
    };

    "org/gnome/desktop/interface" = {
      "cursor-theme" = "Yaru";
      "font-name" = "Roboto 11";
      "icon-theme" = "Tela-circle-dark";
      "color-scheme" = "prefer-dark";
      "document-font-name" = "Roboto 11";
      "enable-animations" = false;
      "enable-hot-corners" = false;
      "font-antialiasing" = "grayscale";
      "font-hinting" = "slight";
      "monospace-font-name" = "MesloLGS Nerd Font Mono 13";
      "show-battery-percentage" = true;
      "toolkit-accessibility" = false;
    };

    "org/gnome/tweaks" = {
      "show-extensions-notice" = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      "custom-colors" = [(mkTuple [0.74901962280273438 0.7450980544090271 0.7764706015586853 1.0])];
      "selected-color" = mkTuple [true 0.87058824300765991 0.86666667461395264 0.85490196943283081 1.0];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      "show-hidden" = true;
    };

    "org/gtk/settings/file-chooser" = {
      "date-format" = "regular";
      "location-mode" = "path-bar";
      "show-hidden" = true;
      "show-size-column" = true;
      "show-type-column" = true;
      "sort-column" = "name";
      "sort-directories-first" = true;
      "sort-order" = "ascending";
      "type-format" = "category";
      "view-type" = "list";
    };

    "org/gnome/desktop/background" = {
      "color-shading-type" = "solid";
      "picture-options" = "zoom";
      "picture-uri" = "file://${config.wallpaper}";
      "picture-uri-dark" = "file://${config.wallpaper}";
      "primary-color" = "#000000000000";
      "secondary-color" = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      "current" = mkUint32 0;
      "mru-sources" = [(mkTuple ["xkb" "pl"]) (mkTuple ["xkb" "ru"])];
      "show-all-sources" = false;
      "sources" = [(mkTuple ["xkb" "pl"]) (mkTuple ["xkb" "ru"])];
      "xkb-options" = ["terminate:ctrl_alt_bksp"];
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      "delay" = mkUint32 250;
      "repeat-interval" = mkUint32 20;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      "speed" = 0.0;
      "accel-profile" = "flat";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      "speed" = 0.4;
      "tap-to-click" = true;
      "two-finger-scrolling-enabled" = true;
    };

    "org/gnome/desktop/privacy" = {
      "old-files-age" = mkUint32 30;
      "recent-files-max-age" = -1;
    };

    "org/gnome/desktop/session" = {
      "idle-delay" = mkUint32 0;
    };

    "org/gnome/desktop/wm/keybindings" = {
      "close" = ["<Super>q"];
      "minimize" = ["<Super>comma"];
      "move-to-center" = ["<Control><Alt>c"];
      "move-to-workspace-1" = ["<Super><Shift>1"];
      "move-to-workspace-10" = ["<Super><Shift>0"];
      "move-to-workspace-2" = ["<Super><Shift>2"];
      "move-to-workspace-3" = ["<Super><Shift>3"];
      "move-to-workspace-4" = ["<Super><Shift>4"];
      "move-to-workspace-5" = ["<Super><Shift>5"];
      "move-to-workspace-6" = ["<Super><Shift>6"];
      "move-to-workspace-7" = ["<Super><Shift>7"];
      "move-to-workspace-8" = ["<Super><Shift>8"];
      "move-to-workspace-9" = ["<Super><Shift>9"];
      "switch-applications" = ["<Super>Tab"];
      "switch-to-workspace-1" = ["<Super>1"];
      "switch-to-workspace-2" = ["<Super>2"];
      "switch-to-workspace-3" = ["<Super>3"];
      "switch-to-workspace-4" = ["<Super>4"];
      "switch-to-workspace-5" = ["<Super>5"];
      "switch-to-workspace-6" = ["<Super>6"];
      "switch-to-workspace-7" = ["<Super>7"];
      "switch-to-workspace-8" = ["<Super>8"];
      "switch-to-workspace-9" = ["<Super>9"];
      "toggle-fullscreen" = ["<Super>m"];
    };

    "org/gnome/desktop/wm/preferences" = {
      "button-layout" = lib.mkForce "";
      "focus-mode" = "sloppy";
      "num-workspaces" = 5;
      "titlebar-font" = "Roboto Bold 11";
      "workspace-names" = ["1"];
    };

    "org/gnome/mutter" = {
      "center-new-windows" = true;
      "dynamic-workspaces" = true;
      "edge-tiling" = false;
    };

    "org/gnome/nautilus/preferences" = {
      "default-folder-viewer" = "list-view";
      "migrated-gtk-settings" = true;
      "search-filter-time-type" = "last_modified";
      "search-view" = "list-view";
    };


    "org/gnome/settings-daemon/plugins/media-keys" = {
      "custom-keybindings" = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/"
      ];
      "screensaver" = ["<Alt><Ctrl>l"];
    };



    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      "binding" = "<Shift><Super>Return";
      "command" = "alacritty";
      "name" = "Alacritty";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      "binding" = "<Shift><Super>b";
      "command" = "brave";
      "name" = "Brave";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5" = {
      "binding" = "<Shift><Super>f";
      "command" = "nautilus";
      "name" = "Files";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6" = {
      "binding" = "<Alt><Ctrl>q";
      "command" = "gnome-session-quit";
      "name" = "Logout";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      "sleep-inactive-ac-type" = "nothing";
      "sleep-inactive-battery-type" = "nothing";
    };

    "org/gnome/shell" = {
      "disable-user-extensions" = false;
      "enabled-extensions" = [
        "dash-to-dock@micxgx.gmail.com"
        "just-perfection-desktop@just-perfection"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
      "favorite-apps" = [
        "org.gnome.Nautilus.desktop"
        "brave-browser.desktop"
        "Alacritty.desktop"
        "org.telegram.desktop.desktop"
      ];
    };


    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      "pipeline" = "pipeline_default";
    };


    "org/gnome/shell/extensions/dash-to-dock" = {
      "animate-show-apps" = false;
      "apply-custom-theme" = false;
      "autohide" = true;
      "background-color" = "rgb(24,25,38)";
      "background-opacity" = 0.8;
      "custom-background-color" = true;
      "custom-theme-shrink" = true;
      "dash-max-icon-size" = 32;
      "dock-fixed" = false;
      "dock-position" = "BOTTOM";
      "extend-height" = false;
      "height-fraction" = 0.9;
      "hot-keys" = false;
      "intellihide" = false;
      "intellihide-mode" = "FOCUS_APPLICATION_WINDOWS";
      "preferred-monitor" = -2;
      "preferred-monitor-by-connector" = "DisplayPort-0";
      "preview-size-scale" = 0.0;
      "show-show-apps-button" = false;
      "show-trash" = false;
      "transparency-mode" = "DYNAMIC";
    };


    "org/gnome/system/location" = {
      "enabled" = true;
    };

    "system/locale" = {
      "region" = "en_US.UTF-8";
    };
  };
}
