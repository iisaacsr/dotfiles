{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        modules-left = [
          "hyprland/workspaces"
          "custom/sep"
          "hyprland/window"
          "custom/sep"
        ];
        modules-right = [
          "battery"
          "custom/sep"
          "network"
          "custom/sep"
          "cpu"
          "custom/sep"
          "memory"
          "custom/sep"
          "disk"
          "custom/sep"
          "clock"
          "custom/sep"
          "tray"
        ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{name}";
          persistent-workspaces = 5;
        };
        "hyprland/window" = {
          max-length = 40;
          separate-outputs = false;
        };
        "tray" = {
          spacing = 10;
        };
        "clock" = {
          format-alt = "{:%Y-%m-%d}";
        };
        "cpu" = {
          format = "CPU: {usage}%";
        };
        "memory" = {
          format = "RAM: {used}G";
        };
        "disk" = {
          interval = 60;
          format = "Disk: {free}";
        };
        "battery" = {
          states = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          format = "{capacity}% {icon} {time}";
          format-plugged = "{capacity}% ";
          format-alt = "{capacity}%";
          format-time = "{H}:{M}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "network" = {
          format-wifi = " ";
          format-ethernet = " ";
          format-disconnected = "⚠";
        };
        "custom/sep" = {
          format = "|";
        };
      };
    };
    style = builtins.readFile ./styles.css;
  };
}
