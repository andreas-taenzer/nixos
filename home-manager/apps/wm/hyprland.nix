{ inputs, lib, config, pkgs, ... }: {

imports = [
    #../common
    #../common/wayland-wm
    inputs.hyprland.homeManagerModules.default
  ];

  home.sessionVariables = rec {
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
   WLR_NO_HARDWARE_CURSORS = "1";
  };

  home.packages = with pkgs; [
    inputs.hyprland-contrib.packages.${system}.grimblast
    swaybg
    swayidle
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
  };  


}
