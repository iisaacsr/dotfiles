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

  programs.bash.enable = true;

  programs.home-manager.enable = true;

  ## waybar

  programs.waybar.enable = true;

  programs.waybar.settings.main = {
    modules-right = [ "clock" ];
  };

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
      backgroundColor = "#1e1e2e";
      textColor = "#cdd6f4";
      borderColor = "#89b4fa";
      borderRadius = 8;
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "autumn_night_transparent";
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
    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };
  };

  home.packages = with pkgs; [
    libnotify
    kitty
  ];

  imports = [
    inputs.zen-browser.homeModules.twilight
    ./discord.nix
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };
}
