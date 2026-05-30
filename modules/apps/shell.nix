{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.fish = {
    enable = true;

    # quiet
    interactiveShellInit = ''
      set -g fish_greeting ""
    '';

    shellAliases = {
      # ls
      "ls" = "eza";
      "ll" = "eza -lbF";
      "la" = "eza -lbhHigUmuSa";
      "lt" = "eza --tree";
      # misc
      ".." = "cd ..";
      "tuf-rebuild" = "sudo nixos-rebuild switch --flake .#lenovo-tuf";
    };
  };

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      theme = "Black Metal (Bathory)";
      font-size = 11;
      background-opacity = 0.75;
    };
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    git = true;
    colors = "auto";
    icons = "auto";
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };
}
