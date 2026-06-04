{ pkgs, ... }: {
  home.packages = with pkgs; [ nixd omnisharp-roslyn ];

  programs.helix.languages = {
    omnisharp = {
      command = "omnisharp";
    };
    nixd = {
      command = "nixd";
    };

    language = [
      {
        name = "c-sharp";
        auto-format = true;
        language-servers = [ "omnisharp" ];
      }
      {
        name = "nix";
        auto-format = true;
        language-servers = [ "nixd" ];
      }
    ];
  };
}
