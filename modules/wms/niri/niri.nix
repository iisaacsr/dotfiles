{ pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
  ];
  
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;

    settings = {
      environment = {
        NIXOS_OZONE_WL = "1";
      };
    };
  };
}
