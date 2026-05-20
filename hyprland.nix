{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";

    settings = {
      dwindle = {
        preserve_split = true;
      };

      monitor = [
        ",preferred,auto,auto"
      ];
    };
  };
}
