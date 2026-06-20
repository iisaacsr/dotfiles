{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "/home/isaac/Pictures/wallpaper.jpg"
      ];
      wallpaper = [
        {
          monitor = "";
          path = "/home/isaac/Pictures/wallpaper.jpg";
        }
      ];
    };
  };
}
