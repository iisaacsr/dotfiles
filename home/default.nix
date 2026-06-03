{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../modules/apps/discord.nix
    ../modules/apps/shell.nix
    ../modules/hyprland/hyprland.nix
    ../modules/apps/waybar/waybar.nix
    ../modules/apps/obsidian.nix
    ../modules/apps/helix.nix
    ../modules/apps/yazi.nix
    ../modules/apps/mako.nix
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrains Mono Nerd Font" ];
      sansSerif = [ "JetBrains Mono Nerd Font" ];
      serif = [ "JetBrains Mono Font" ];
    };
  };

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

  services.ssh-agent.enable = true;

  home.packages = with pkgs; [
    inputs.hyprcap.packages.${pkgs.stdenv.hostPlatform.system}.default
    libnotify
    fastfetch
    nerd-fonts._0xproto
    spotify
  ];
}
