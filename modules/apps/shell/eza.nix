{ config, pkgs, ... }:
{
  programs.eza = {
    enable = true;
    git = true;
    colors = "auto";
    icons = "auto";
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };
}
