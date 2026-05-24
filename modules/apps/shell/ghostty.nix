{ pkgs, config, ... }:
{
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "Black Metal (Bathory)";
      font-size = 11;
      background-opacity = 0.9;
    };
  };
}
