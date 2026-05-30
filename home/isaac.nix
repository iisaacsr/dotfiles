{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  home.username = "isaac";
  home.homeDirectory = "/home/isaac";
  home.stateVersion = "25.11";

  imports = [
    ../modules/apps/discord.nix
    ../modules/apps/shell/ghostty.nix
    ../modules/apps/shell/eza.nix
    ../modules/hyprland/hyprland.nix
    ../modules/apps/waybar/waybar.nix
    ../modules/apps/opencode.nix
    ../modules/apps/obsidian.nix
    ../modules/apps/helix.nix
    ../modules/apps/yazi.nix
  ];

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    settings = {
      user.name = "iisaacsr";
      user.email = "isaacsroy3@gmail.com";
      init.defaultBranch = "main";
      credential = {
        "https://github.com" = {
          helper = "store";
        };
      };
    };
  };

  programs.jq.enable = true;

  programs.home-manager.enable = true;

  programs.fuzzel.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*" = {
      AddKeysToAgent = "yes";
    };
  };

  services.mako = {
    enable = true;
    settings = {
      font = "sans-serif 10";
      background-color = "#1e1e2e";
      text-color = "#cdd6f4";
      border-color = "#89b4fa";
      border-radius = 8;
    };
  };

  services.ssh-agent.enable = true;

  home.packages = with pkgs; [
    inputs.hyprcap.packages.${pkgs.stdenv.hostPlatform.system}.default
    brightnessctl
    libnotify
    fastfetch
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    spotify
  ];
}
