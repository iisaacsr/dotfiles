{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.factorio = {
    enable = true;
    game-name = "kittenstorio";
    saveName = "kittenstorio";
    package = pkgs.factorio-headless;
    openFirewall = true;

    admins = [
      "yunac"
    ];
  };

  # to disable expansions other than base
  systemd.services.factorio.preStart = ''
    mkdir -p /var/lib/factorio/mods
    cat <<JSON > /var/lib/factorio/mods/mod-list.json
    {
      "mods": [
        { "name": "base", "enabled": true },
        { "name": "elevated-rails", "enabled": false },
        { "name": "quality", "enabled": false },
        { "name": "space-age", "enabled": false }
      ]
    }
    JSON
    chown -R factorio:factorio /var/lib/factorio/mods
  '';

  systemd.services.factorio.serviceConfig = {
    ProtectHome = true;
    ProtectSystem = "strict";
    NoNewPrivileges = true;
    PrivateDevices = true;
    PrivateTmp = true;
    ReadWritePaths = [ "/var/lib/factorio" ];
  };
}
