{ ... }:

{
  imports = [ ./hyprpaper.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";

    settings = {
    
      cursor = {
        no_hardware_cursors = true;
        inactive_timeout = 0;
      };

      env = [
        "XCURSOR_SIZE, 24"
        "HYPRCURSOR_SIZE, 24"
      ];

      exec-once = [
        "hyprpaper"
        "waybar"
        "hyprctl setcursor Bibata-Modern-Classic 24"
      ];

      dwindle = {
        preserve_split = true;
      };

      monitor = [
        "eDP-1, 1920x1080@144, 0x0, 1"
        "HDMI-A-1, 1920x1080@144, 1920x0, 1"
      ];

      "$mod" = "SUPER";
      bind = [
        # basic
        "$mod, Q, exec, ghostty"
        "$mod, R, exec, fuzzel"
        "$mod, C, killactive"
        "$mod, F, togglefloating"
        "$mod, T, fullscreen"
        # arrow key move thru windows
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        # workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        # misc
        "$mod SHIFT, S, exec, hyprcap shot"
      ];
      # volume knob
      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];
    };
  };
}
