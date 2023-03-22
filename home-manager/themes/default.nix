{ pkgs, config, inputs, ... }: {

  imports = [
 # 	./nixcolors.nix
 	./fonts.nix
  ./picom.nix
  ./waybar
	];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    lxappearance
    nordic
    nordzy-icon-theme
    nordzy-cursor-theme
    catppuccin-gtk
    catppuccin-kvantum
    catppuccin-cursors
    catppuccin-papirus-folders
    ];

}
