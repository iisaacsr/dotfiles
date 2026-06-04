{ ... }: {
  imports = [ ./lsp.nix ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "orange-white";
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };

    themes = import ./theme.nix;
  };
}
