{config, ...}: let
  data = config.xdg.dataHome;
  conf = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./browsers
    ./editors
    ./media
    ./terminal
  ];

  home.sessionVariables = {
    # clean up ~
    LESSHISTFILE = "${cache}/less/history";
    LESSKEY = "${conf}/less/lesskey";

    WINEPREFIX = "${data}/wine";
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";

    DIRENV_LOG_FORMAT = "";

    VIDEO_PLAYER = "mpv";
    TERMINAL = "foot";
    EDITOR = "hx";
    FILEMANAGER = "yazi";

    # auto-run programs using nix-index-database
    NIX_AUTO_RUN = "1";
  };
}
