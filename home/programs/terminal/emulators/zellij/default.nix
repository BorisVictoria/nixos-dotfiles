{pkgs, ...}: {
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."yazelix".source = ./yazelix;
  xdg.configFile."yazelix".recursive = true;
}
