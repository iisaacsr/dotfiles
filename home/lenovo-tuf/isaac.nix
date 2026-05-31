{
  pkgs,
  inputs,
  ...
}:

{
  home.username = "isaac";
  home.homeDirectory = "/home/isaac";
  home.stateVersion = "25.11";

  imports = [
    ../default.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
  ];
}
