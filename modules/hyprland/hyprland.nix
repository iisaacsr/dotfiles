{ config, pkgs, ... }:

{
  imports = [ ./hyprpaper.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";

    settings = {
      exec-once = [
        "hyprpaper"
        "waybar"
      ];

      dwindle = {
        preserve_split = true;
      };

      monitor = [
        ",preferred,auto,1"
      ];

      "$mod" = "SUPER";
      bind = [
        # basic
        "$mod, Q, exec, ghostty"
        "$mod, R, exec, wofi --show drun"
        "$mod, C, killactive"
        # arrow key move thru windows
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        # workspace moving
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        # misc
      ];
    };
  };
}
