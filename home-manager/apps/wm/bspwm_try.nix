{ config, lib, pkgs, ... }:

{
  imports = [
    (import ../../environment/bspwm-variables.nix)
  ];
  xsession = {
    enable = true;
    numlock.enable = true;
    windowManager.bspwm = {
      enable = true;
      alwaysResetDesktops = true;
      startupPrograms = [
        "sxhkd"
        "dunst"
        "sleep 2s; eww open bar"
      ];
      monitors = {
        eDP-1 = [
          "I"
          "II"
          "III"
          "IV"
          "V"
          "VI"
        ];
      };
      rules = {
        "mpv" = {
          state = "floating";
          center = true;
        };
        "firefox" = {
          follow = true;
          desktop = ^2;
        };
        "nemo" = {
          state = "floating";
          center = true;
        };
      };
      settings = {
        # pointer_modifier = "mod1";
        left_padding = 120;
        border_width = 4;
        window_gap = 20;
        split_ratio = 0.5;
        borderless_monocle = true;
        gapless_monocle = true;
        focus_follows_pointer = true;
        normal_border_color = "$background";
        focused_border_color = "$background";
        urgent_border_color = "$background";
        active_border_color = "$color15";
        
      };
      extraConfig = ''
      '';
      extraConfigEarly = ''
        systemctl --user start bspwm-session.target 
      '';
    };
  };
  };
}
