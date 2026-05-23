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
          seperate-outputs = false;
        };
        "tray" = {
          spacing = 10;
        };
        "clock" = {
          format-alt = "{:%Y-%m-%d}";
        };
        "memory" = {
          format = "Mem: {used}G";
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
          format = "Bat: {capacity}% {icon} {time}";
          format-plugged = "{capacity}% ";
          format-alt = "Bat {capacity}%";
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
          format = "Online";
          format-disconnected = "Disconnected ⚠";
        };
        "custom/sep" = {
          format = "|";
          interval = 0;
        };
      };
    };
    style = builtins.readFile ./styles.css;
  };
}
