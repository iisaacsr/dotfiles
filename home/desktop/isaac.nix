{
  pkgs,
  inputs,
  ...
}:

{
  home.username = "isaac";
  home.homeDirectory = "/home/isaac";
  home.stateVersion = "25.11";
  
  imports = [
    ../default.nix
    ../../modules/apps/opencode.nix
  ];

  programs.obs-studio = {
    enable = true;
  };

  home.packages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        jdk25
        jdk21
        jdk17
      ];
    })
    godot
    deadlock-mod-manager
  ];
}
