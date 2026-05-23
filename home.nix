{
  config,
  pkgs,
  system,
  lib,
  inputs,
  ...
}:

let
  system = "x86_64-linux";
in
{

  home.stateVersion = "25.11";
  home.username = "isaac";
  home.homeDirectory = "/home/isaac";

  fonts.fontconfig.enable = true;

  programs.bash.enable = true;

  programs.home-manager.enable = true;

  programs.wofi.enable = true;

  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
      };
    };
  };

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

  programs.helix = {
    enable = true;
    settings = {
      theme = "amberwood";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
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

  home.packages = with pkgs; [
    libnotify
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    spotify
  ];

  imports = [
    inputs.zen-browser.homeModules.twilight
    ./discord.nix
    ./hyprland.nix
    ./ghostty.nix
    ./waybar.nix
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };
}
