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
          "1"
          "2"
          "3"
          "4"
          "5"
          "6"
        ];
      };
      rules = {
        "mpv" = {
          state = "floating";
          center = true;
        };
        "URxvt" = {
          follow = true;
          desktop = "1";
        };
        "firefox" = {
          desktop = "2";
          follow = true;
        };
        "kitty:ncmpcpp" = {
          desktop = "3";
          state  = "floating";
	        rectangle = "1300x800+2500+100";
        };
        "kitty:cava" = {
          desktop = "3";
          state = "floating";
          rectangle = "1300x800+2500+1000";
        };
      };

      settings = {
        # pointer_modifier = "mod1";
        left_padding = 120;
        border_width = 4;
        window_gap = 20;
        split_ratio = 0.65;
        borderless_monocle = true;
        gapless_monocle = true;
        focus_follows_pointer = true;
        normal_border_color = "$background";
        focused_border_color = "$background";
        urgent_border_color = "$background";
        active_border_color = "$color2";

      };
      extraConfig = ''
      '';
      extraConfigEarly = ''
        systemctl --user start bspwm-session.target 
      '';
    };
  };
}
