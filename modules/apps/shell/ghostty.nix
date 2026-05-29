{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      theme = "Black Metal (Bathory)";
      font-size = 11;
      background-opacity = 0.75;
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
