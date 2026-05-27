{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.factorio = {
    enable = true;
    package = pkgs.factorio-headless;
    openFirewall = true;
  };

  systemd.services.factorio.serviceConfig = {
    ProtectHome = true;
    ProtectSystem = "strict";
    NoNewPrivileges = true;
    PrivateDevices = true;
    PrivateTmp = true;
    ReadWritePaths = [ "/var/lib/factorio" ];
  };
}
