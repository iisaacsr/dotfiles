{ pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "/home/isaac/Pictures/wallpaper.jpg"
      ];
      wallppaper = [
        "/home/isaac/Pictures/wallpaper.jpg"
      ];
    };
  };
}
