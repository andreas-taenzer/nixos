{ config, pkgs, ... }: {

imports = [
    ./bspwm.nix
    ./sxhkd.nix
    ./sway.nix
    ./hyprland
];

}
