{ pkgs, ... }: {
  imports = [
    ./bash.nix
    #./git.nix
    ./pfetch.nix
    ./mpd.nix
    # ./xdg.nix
  ];
  
  home.packages = with pkgs; [
    nitch #
    bc # Calculator
    cbonsai # dah
    cava # visualizer
    tree
    ];
}
