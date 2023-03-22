{ inputs, lib, config, pkgs, ... }: {

imports = [
    #../common
    #../common/wayland-wm
    inputs.hyprland.homeManagerModules.default
  ];


home.packages = with pkgs; [
  inputs.hyprland-contrib.packages.${system}.grimblast
  swaybg
  hyprpaper 
    # TODO
    # inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland
  ];

  wayland.windowManager.hyprland = { # or wayland.windowManager.hyprland
  enable = true;
  xwayland = {
    enable = true;
    hidpi = true;
    };
    nvidiaPatches = true;
    systemdIntegration = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };  


}
