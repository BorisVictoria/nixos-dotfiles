{
  programs.yazi.theme = {
    input = {
      border = {fg = "#89b4fa";};
      title = {};
      value = {};
      selected = {reversed = true;};
    };

    select = {
      border = {fg = "#89b4fa";};
      active = {fg = "#f5c2e7";};
      inactive = {};
    };

    tasks = {
      border = {fg = "#89b4fa";};
      title = {};
      hovered = {underline = true;};
    };

    which = {
      mask = {bg = "#313244";};
      cand = {fg = "#94e2d5";};
      rest = {fg = "#9399b2";};
      desc = {fg = "#f5c2e7";};
      separator = "  ";
      separator_style = {fg = "#585b70";};
    };

    help = {
      on = {fg = "#f5c2e7";};
      exec = {fg = "#94e2d5";};
      desc = {fg = "#9399b2";};
      hovered = {
        bg = "#585b70";
        bold = true;
      };
      footer = {
        fg = "#45475a";
        bg = "#cdd6f4";
      };
    };

    filetype = {
      rules = [
        # Images
        {
          mime = "image/*";
          fg = "#94e2d5";
        }

        # Videos
        {
          mime = "video/*";
          fg = "#f9e2af";
        }
        {
          mime = "audio/*";
          fg = "#f9e2af";
        }

        # Archives
        {
          mime = "application/zip";
          fg = "#f5c2e7";
        }
        {
          mime = "application/gzip";
          fg = "#f5c2e7";
        }
        {
          mime = "application/x-tar";
          fg = "#f5c2e7";
        }
        {
          mime = "application/x-bzip";
          fg = "#f5c2e7";
        }
        {
          mime = "application/x-bzip2";
          fg = "#f5c2e7";
        }
        {
          mime = "application/x-7z-compressed";
          fg = "#f5c2e7";
        }

        # Fallback
        {
          name = "*";
          fg = "#cdd6f4";
        }
        {
          name = "*/";
          fg = "#89b4fa";
        }
      ];
    };
  };
}
