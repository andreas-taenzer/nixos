{ inputs, lib, config, pkgs, ... }: {



home.packages = with pkgs; [
  swaybg
  swayidle
  ];

  wayland.windowManager.sway = { # or wayland.windowManager.hyprland
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [
        {command = "kitty";}
        ];
      
      output = {
       eDP-1 = {
         res = "3840x2160";
	 scale = "2";
	 };
      };	 
     };
   };
}
