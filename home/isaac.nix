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
    inputs.zen-browser.homeModules.twilight
    ../modules/apps/discord.nix
    ../modules/apps/ghostty.nix
    ../modules/hyprland/hyprland.nix
    ../modules/apps/waybar/waybar.nix
  ];

  fonts.fontconfig.enable = true;

  programs.bash.enable = true;

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    settings = {
      user.name = "iisaacsr";
      user.email = "isaacsroy3@gmail.com";
      credential.helper = "libsecret";
      init.defaultBranch = "main";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "amberwood";
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      }
    ];
  };

  programs.home-manager.enable = true;

  programs.fuzzel.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*" = {
      AddKeysToAgent = "yes";
    };
  };

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
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
    brightnessctl
    libnotify
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    spotify
  ];
}
