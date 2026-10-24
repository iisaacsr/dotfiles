{
  pkgs,
  ...
}:

{
  # xdg-open/xdg-mime are needed by anything that hands a URI to the
  # freedesktop handler list (e.g. Deadlock Mod Manager launching the game
  # through steam://run/<appid>).
  environment.systemPackages = with pkgs; [
    xdg-utils
  ];
}
