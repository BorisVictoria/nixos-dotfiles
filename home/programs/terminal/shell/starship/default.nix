{
  config,
  lib,
  pkgs,
  ...
}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    catppuccin.enable = false;
  };
  xdg.configFile."starship.toml".source = ./starship.toml;
}
