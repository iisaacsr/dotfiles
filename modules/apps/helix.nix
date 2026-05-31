{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.nixd
    pkgs.omnisharp-roslyn
  ];

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

    languages = {

      # lsps
      omnisharp = {
        command = "omnisharp";
      };
      nixd = {
        command = "nixd";
      };

      # langs
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
  };
}
