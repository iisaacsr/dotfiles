{ lib, ... }:

let
  lua = lib.generators.mkLuaInline;

  bind = key: dispatcher: options: {
    _args = [
      (lua key)
      (lua dispatcher)
    ] ++ lib.optional (options != null) options;
  };
in
{
  imports = [ ./hyprpaper.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    settings = {
      # The Lua renderer maps each top-level setting to an hl.<name>(...) call.
      # `config` therefore wraps the ordinary compositor options in hl.config.
      config = {
        general.allow_tearing = true;

        cursor = {
          no_hardware_cursors = true;
          inactive_timeout = 0;
        };

        dwindle = {
          preserve_split = true;
          force_split = 2;
        };

        render.direct_scanout = 0;
        xwayland.force_zero_scaling = true;
        decoration.blur.enabled = false;
      };

      mainMod = {
        _var = "SUPER";
      };

      env = [
        { _args = [ "XCURSOR_SIZE" "24" ]; }
        { _args = [ "HYPRCURSOR_SIZE" "24" ]; }
        { _args = [ "GBM_BACKEND" "nvidia-drm" ]; }
        { _args = [ "XDG_SESSION_TYPE" "wayland" ]; }
        { _args = [ "__GL_GSYNC_ALLOWED" "0" ]; }
        { _args = [ "__GL_VRR_ALLOWED" "0" ]; }
        { _args = [ "LIBVA_DRIVER_NAME" "nvidia" ]; }
        { _args = [ "__GLX_VENDOR_LIBRARY_NAME" "nvidia" ]; }
        { _args = [ "ELECTRON_OZONE_PLATFORM_HINT" "auto" ]; }
      ];

      monitor = [
        {
          _args = [
            {
              output = "DP-3";
              mode = "3440x1440@165";
              position = "0x0";
              scale = 1;
            }
          ];
        }
      ];

      on = [
        {
          _args = [
            "hyprland.start"
            (lua ''
              function()
                hl.exec_cmd("hyprpaper")
                hl.exec_cmd("waybar")
                hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
              end
            '')
          ];
        }
      ];

      bind = [
        # Basic
        (bind ''mainMod .. " + Q"'' ''hl.dsp.exec_cmd("ghostty")'' null)
        (bind ''mainMod .. " + R"'' ''hl.dsp.exec_cmd("fuzzel")'' null)
        (bind ''mainMod .. " + C"'' ''hl.dsp.window.close()'' null)
        (bind ''mainMod .. " + F"'' ''hl.dsp.window.float({ action = "toggle" })'' null)
        (bind ''mainMod .. " + T"'' ''hl.dsp.window.fullscreen({ action = "toggle" })'' null)

        # Move focus between windows
        (bind ''mainMod .. " + H"'' ''hl.dsp.focus({ direction = "left" })'' null)
        (bind ''mainMod .. " + L"'' ''hl.dsp.focus({ direction = "right" })'' null)
        (bind ''mainMod .. " + K"'' ''hl.dsp.focus({ direction = "up" })'' null)
        (bind ''mainMod .. " + J"'' ''hl.dsp.focus({ direction = "down" })'' null)

        # Resize by relative 50 px steps (U/I/O/P = left/up/down/right)
        (bind ''mainMod .. " + U"'' ''hl.dsp.window.resize({ x = -50, y = 0, relative = true })'' null)
        (bind ''mainMod .. " + I"'' ''hl.dsp.window.resize({ x = 0, y = 50, relative = true })'' null)
        (bind ''mainMod .. " + O"'' ''hl.dsp.window.resize({ x = 0, y = -50, relative = true })'' null)
        (bind ''mainMod .. " + P"'' ''hl.dsp.window.resize({ x = 50, y = 0, relative = true })'' null)

        # Move windows
        (bind ''mainMod .. " + SHIFT + H"'' ''hl.dsp.window.move({ direction = "left" })'' null)
        (bind ''mainMod .. " + SHIFT + J"'' ''hl.dsp.window.move({ direction = "down" })'' null)
        (bind ''mainMod .. " + SHIFT + K"'' ''hl.dsp.window.move({ direction = "up" })'' null)
        (bind ''mainMod .. " + SHIFT + L"'' ''hl.dsp.window.move({ direction = "right" })'' null)

        # Workspaces
        (bind ''mainMod .. " + 1"'' ''hl.dsp.focus({ workspace = 1 })'' null)
        (bind ''mainMod .. " + 2"'' ''hl.dsp.focus({ workspace = 2 })'' null)
        (bind ''mainMod .. " + 3"'' ''hl.dsp.focus({ workspace = 3 })'' null)
        (bind ''mainMod .. " + 4"'' ''hl.dsp.focus({ workspace = 4 })'' null)
        (bind ''mainMod .. " + 5"'' ''hl.dsp.focus({ workspace = 5 })'' null)
        (bind ''mainMod .. " + 6"'' ''hl.dsp.focus({ workspace = 6 })'' null)
        (bind ''mainMod .. " + 7"'' ''hl.dsp.focus({ workspace = 7 })'' null)
        (bind ''mainMod .. " + SHIFT + 1"'' ''hl.dsp.window.move({ workspace = 1 })'' null)
        (bind ''mainMod .. " + SHIFT + 2"'' ''hl.dsp.window.move({ workspace = 2 })'' null)
        (bind ''mainMod .. " + SHIFT + 3"'' ''hl.dsp.window.move({ workspace = 3 })'' null)
        (bind ''mainMod .. " + SHIFT + 4"'' ''hl.dsp.window.move({ workspace = 4 })'' null)
        (bind ''mainMod .. " + SHIFT + 5"'' ''hl.dsp.window.move({ workspace = 5 })'' null)
        (bind ''mainMod .. " + SHIFT + 6"'' ''hl.dsp.window.move({ workspace = 6 })'' null)
        (bind ''mainMod .. " + SHIFT + 7"'' ''hl.dsp.window.move({ workspace = 7 })'' null)

        # Miscellaneous
        (bind ''mainMod .. " + SHIFT + S"'' ''hl.dsp.exec_cmd("hyprcap shot")'' null)
        (bind ''mainMod .. " + SHIFT + M"'' ''hl.dsp.exit()'' null)
        (bind ''mainMod .. " + mouse_up"'' ''hl.dsp.focus({ workspace = "e-1" })'' null)
        (bind ''mainMod .. " + mouse_down"'' ''hl.dsp.focus({ workspace = "e+1" })'' null)

        # Volume keys (legacy bindle behavior: repeat while held, including when locked)
        (bind ''"XF86AudioRaiseVolume"'' ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")'' { locked = true; repeating = true; })
        (bind ''"XF86AudioLowerVolume"'' ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'' { locked = true; repeating = true; })
        (bind ''"XF86AudioMute"'' ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'' { locked = true; repeating = true; })
        (bind ''"XF86AudioMicMute"'' ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")'' { locked = true; repeating = true; })
      ];
    };
  };
}
