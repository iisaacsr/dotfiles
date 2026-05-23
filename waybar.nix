{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;
        modules-left = [
          "sway/workspaces"
          "wlr/taskbar"
        ];
        modules-center = [ "clock" ];
      };
    };
  };
}
