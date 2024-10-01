if (($env.WAYLAND_DISPLAY? | is-empty) and $env.XDG_VTNR == "1" ) {
    exec Hyprland
}