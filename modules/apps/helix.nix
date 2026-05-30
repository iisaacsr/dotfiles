{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.csharp-ls
    pkgs.nixd
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
      csharp-ls = {
        command = "csharp-ls";
      };
      nil = {
        command = "nixd";
      };

      # langs
      language = [
        {
          name = "c-sharp";
          auto-format = true;
          language-servers = [ "csharp-ls" ];
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
