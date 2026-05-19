{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.vesktop
  ];

  xdg.configFile."vesktop/settings.json".text = builtins.toJSON {
    minimizeToTray = true;
    discordBranch = "stable";
    hardwareAcceleration = true;
  };
}
