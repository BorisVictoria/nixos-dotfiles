{
  pkgs,
  inputs,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        mouse = true;
        auto-completion = true;
        auto-format = true;
        auto-save = true;
        bufferline = "always";

        line-number = "relative";
        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
        };
      };

      keys = {
        normal = {
          space = {
            f = ":format";
            q = ":q";
            w = ":w";
          };
        };
      };
    };

    extraPackages = with pkgs; [
      # bash
      bash-language-server

      # c
      clang-tools

      # html, css, javascript
      vscode-langservers-extracted
      nodePackages.typescript-language-server

      # go
      gopls

      # markdown
      marksman

      # python
      python312Packages.python-lsp-server

      # nix
      nil

      # rust
      rust-analyzer

      # svelte
      nodePackages.svelte-language-server

      # yaml
      nodePackages.yaml-language-server
    ];

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
      ];
    };
  };
}
