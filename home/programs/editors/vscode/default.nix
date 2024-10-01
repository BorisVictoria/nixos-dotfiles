{
  pkgs,
  config,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      ms-vscode.cpptools
      svelte.svelte-vscode
    ];
    userSettings = {
      "editor.wordWrap" = "on";
      "editor.fontFamily" = "'JetBrains Mono Nerd Font'";
      "editor.semanticHighlighting.enabled" = true;
      "terminal.integrated.minimumContrastRatio" = 1;
      "window.titleBarStyle" = "custom";
      "workbench.iconTheme" = "Catppuccin Mocha";
      "workbench.startupEditor" = "none";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "explorer.compactFolders" = false;
      "editor.fontSize" = 16;
      "workbench.tree.indent" = 20;
    };
  };
}
