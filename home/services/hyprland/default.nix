{ pkgs, inputs, ... }:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    wpaperd -d &
    ags &
    clipse -listen &
    udisksctl mount -b /dev/sdd1 &
  '';

  screenshot = ''grim -g "$(slurp -d)"'';
in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    catppuccin = {
      enable = true;
      accent = "rosewater";
      flavor = "mocha";
    };

    settings = {
      monitor = [ "DP-1,1920x1080@144,0x0,1" "DP-2,1920x1080@60,1920x0,1" ];
      exec-once = "${startupScript}/bin/start";
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        force_no_accel = true;
        repeat_rate = 60;
        repeat_delay = 200;
      };
      general = {
        gaps_in = 3;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgb(f7768e) rgb(2ac3de)";
        "col.inactive_border" = "rgb(313244)";
        layout = "dwindle";
        allow_tearing = true;
      };
      decoration = {
        rounding = 10;
        blur = { enabled = false; };
        inactive_opacity = 1.0;
        active_opacity = 1.0;
        fullscreen_opacity = 1.0;
        drop_shadow = false;
      };
      animations = {
        enabled = true;
        animation = [
          "border, 1, 2, default"
          "fade, 1, 4, default"
          "windows, 1, 3, default, slide"
          "workspaces, 1, 2, default, slidevert"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      gestures = { workspace_swipe = false; };

      misc = {
        disable_hyprland_logo = true;
        vrr = 1;
      };
      cursor = {
        no_hardware_cursors = false;
        no_break_fs_vrr = true;
        min_refresh_rate = 60;
        allow_dumb_copy = true;
      };
      opengl = { force_introspection = 0; };
      render = {
        explicit_sync = 1;
        explicit_sync_kms = 1;
        direct_scanout = true;
      };

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "float,title:(clipse)"
        "immediate, class:.*"
      ];
      workspace = [
        "1, monitor:DP-1, default: true"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:DP-2, default: true"
        "6, monitor:DP-2"
        "7, monitor:DP-2"
        "8, monitor:DP-2"
      ];

      "$mainMod" = "SUPER";
      bind = [
        # Example Binds
        "$mainMod, F, exec, anyrun"
        "$mainMod, SPACE, exec, ags -t app-launcher"
        "$mainMod, RETURN, exec, foot"
        "$mainMod, C, killactive,"
        "$mainMod, Q, exit,"
        "$mainMod, E, exec, foot zellij -l welcome --config-dir ~/.config/yazelix/zellij options --layout-dir ~/.config/yazelix/zellij/layouts"
        "$mainMod, V, exec, foot --title clipse -e clipse"
        "$mainMod, T, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, J, fullscreen,"
        ",Print, exec, ${screenshot} - | wl-copy"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
