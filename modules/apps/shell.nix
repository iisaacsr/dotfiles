{ ... }:
let
  highlight = "#e39a5e";
  text  = "#ffffff";
in
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
      "desktop-rebuild" = "sudo nixos-rebuild switch --flake .#desktop";
    };
  };

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      font-size = 11;

      # mini theme (no nonsense)
      background-opacity = 0.75;
      background = "000000";
      foreground = "${text}";

      palette = [
      "1 = ${text}"
      "2 = ${highlight}"
      "3 = ${highlight}"
      "4 = ${text}"
      "5 = ${text}"
      "6 = ${text}"
      "9 = ${text}"
      "11 = ${highlight}"
      "12 = ${text}"
      "13 = ${text}"
      "14 = ${text}"
      ];
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
