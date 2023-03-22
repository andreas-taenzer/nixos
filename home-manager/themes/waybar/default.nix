{ pkgs, lib, config, ...}: {

  xdg.configFile."waybar/style.css".text = import ./style.nix;

  programs.waybar = {
    enable = true;
     package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 48;
        spacing = 7;
        fixed-center = false;
        exclusive = true;
        modules-left = [
          "wlr/workspaces"
          "backlight"
          "battery"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = ["pulseaudio" "cpu" "network"];

        "wlr/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          active-only = false;
          format-icons = {
            default = "";
            active = " 󰮯";
          };
        };

        clock = {
          format = "{:%b %d %H:%M}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
        backlight = {
          format = "{icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        cpu = {
          interval = 5;
          format = "  {}%";
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "";
          format-plugged = "";
          format-alt = "{icon} {capacity}%";
          format-icons = ["" "" "" "" "" "" "" "" "" "" "" ""];
        };
        network = {
          format-wifi = "󰤨 {essid} {signalStrength}%";
          format-ethernet = "󰤨 {bandwidthTotalBytes}";
          format-alt = "󰤨 {ipaddr}/{ifname}";
          format-disconnected = "󰤭";
          tooltip-format = "{ipaddr}/{ifname} via {gwaddr} ({signalStrength}%)";
        };
        pulseaudio = {
          scroll-step = 5;
          tooltip = false;
          format = "{icon} {volume}%";
          format-icons = {default = ["" "" "墳"];};
          on-click = "${pkgs.killall}/bin/killall pavucontrol || ${pkgs.pavucontrol}/bin/pavucontrol";
        };
      };
    };
  };
}
