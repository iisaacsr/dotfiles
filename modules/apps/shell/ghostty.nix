{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      theme = "Black Metal (Bathory)";
      font-size = 11;
      background-opacity = 0.75;
    };
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;

    changeDirWidgetCommand = "fd --type d";
    defaultCommand = "fd --type f";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
