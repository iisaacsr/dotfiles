{ pkgs, config, ... }:
{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      theme = "Black Metal (Bathory)";
      font-size = 11;
      background-opacity = 0.9;
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
