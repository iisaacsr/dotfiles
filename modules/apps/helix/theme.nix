let
  text      = "#ffffff";
  highlight = "#e39a5e";
  error     = "#ff5555";
  warning   = "#ffb86c";
  info      = "#8be9fd";
  hint      = "#50fa7b";
in
{
  orange-white = {
    "inherits" = "base16_default";

    "ui.background" = "{}";
    "ui.selection" = { fg = "#000000"; bg = "${text}"; modifiers = ["underline"]; };
    "ui.selection.primary" = { fg = "#000000"; bg = "${text}"; };
    "ui.statusline" = { fg = "${text}"; bg = "{}"; };
    "ui.window" = { bg = "{}"; };
    "ui.virtual.indent-guide" = { fg = "#262626"; };

    "ui.linenr" = { fg = "#3d3d3d"; bg = "{}"; };
    "ui.linenr.selected" = { fg = "${text}"; bg = "{}"; };
    "ui.gutter" = { bg = "{}"; };
    "ui.gutter.selected" = { bg = "{}"; };

    "error" = { fg = "${error}"; bg = "{}"; modifiers = ["bold"]; };
    "warning" = { fg = "${warning}"; bg = "{}"; };
    "info" = { fg = "${info}"; bg = "{}"; };
    "hint" = { fg = "${hint}"; bg = "{}"; };

    "diagnostic.error" = { underline = { color = "${error}"; style = "curl"; }; };
    "diagnostic.warning" = { underline = { color = "${warning}"; style = "curl"; }; };
    "diagnostic.info" = { underline = { color = "${info}"; style = "curl"; }; };
    "diagnostic.hint" = { underline = { color = "${hint}"; style = "curl"; }; };

    "ui.statusline.diagnostic.error" = { fg = "${error}"; bg = "{}"; };
    "ui.statusline.diagnostic.warning" = { fg = "${warning}"; bg = "{}"; };
    "ui.statusline.diagnostic.info" = { fg = "${info}"; bg = "{}"; };
    "ui.statusline.diagnostic.hint" = { fg = "${hint}"; bg = "{}"; };

    "ui.cursor.match" = { 
      fg = "${text}";
      modifiers = ["bold" "underline"]; 
    };
          
    "punctuation" = "${highlight}";
    "punctuation.bracket" = "${highlight}";
    "punctuation.delimiter" = "${highlight}";
    "string" = "${highlight}";
    "constant" = "${highlight}";
    "constant.character.escape" = "${highlight}";

    "comment" = "#a0a0a0";

    "variable" = "${text}";
    "variable.parameter" = "${text}";
    "variable.other.member" = "${text}";
    "function" = "${text}";
    "function.method" = "${text}";
    "function.builtin" = "${text}";
    "keyword" = "${text}";
    "keyword.control" = "${text}";
    "keyword.directive" = "${text}";
    "type" = "${text}";
    "type.builtin" = "${text}";
    "constructor" = "${text}";
    "operator" = "${text}";
    "label" = "${text}";
    "namespace" = "${text}";
    "ui.text" = "${text}";
  };
}
