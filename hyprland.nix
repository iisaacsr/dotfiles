{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
  };
}
