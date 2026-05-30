{
  config,
  pkgs,
  lib,
  ...
}:
{
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
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt;
      }
      {
        name = "c-sharp";
        auto-format = true;
        language-servers = [ "csharp-ls" ];
      }
    ];
  };
}
