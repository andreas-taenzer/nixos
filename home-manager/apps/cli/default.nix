{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./git.nix
    ./pfetch.nix
    # ./mpd.nix
  ];
  
  home.packages = with pkgs; [
    pfetch #
    bc # Calculator
    cbonsai # dah
    cava # visualizer
    ];
}
