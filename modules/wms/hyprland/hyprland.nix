{ ... }:

{
  imports = [ ./hyprpaper.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";

    settings = {

      general = {
        allow_tearing = true;
      };
    
      cursor = {
        no_hardware_cursors = true;
        inactive_timeout = 0;
      };

      env = [
        "XCURSOR_SIZE, 24"
        "HYPRCURSOR_SIZE, 24"
        "GBM_BACKEND, nvidia-drm"
        "XDG_SESSION_TYPE,wayland"
        "__GL_GSYNC_ALLOWED,0"
        "__GL_VRR_ALLOWED,0"
        "LIBVA_DRIVER_NAME, nvidia"
        "__GLX_VENDOR_LIBRARY_NAME, nvidia"
        "ELECTRON_OZONE_PLATFORM_HINT, auto"
      ];

      exec-once = [
        "hyprpaper"
        "waybar"
        "hyprctl setcursor Bibata-Modern-Classic 24"
      ];

      dwindle = {
        preserve_split = true;
        force_split = 2;
      };

      monitor = [
        "DP-3, 3440x1440@165, 0x0, 1"
      ];

      render = {
        direct_scanout = 0;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      decoration = {
        blur.enabled = false;
      };

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
        # resize (uiop = left, up, down, right)
        "$mod, U, resizeactive, -10% 0"
        "$mod, I, resizeactive, 0 10%"
        "$mod, O, resizeactive, 0 -10%"
        "$mod, P, resizeactive, 10% 0"
        # move windows
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"
        # workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        # misc
        "$mod SHIFT, S, exec, hyprcap shot"
        "$mod SHIFT, M, exit"
        "$mod, mouse_up, workspace, e-1"
        "$mod, mouse_down, workspace, e+1"
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
