{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        spacing = 4;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "cpu"
          "memory"
          "battery"
          "tray"
        ];
        "hyprland/workspaces" = {
          format = "{name}";
        };
      };
    };
    style = builtins.readFile ./styles.css;
  };
}
