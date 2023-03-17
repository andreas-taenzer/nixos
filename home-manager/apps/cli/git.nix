{ pkgs, lib, config, ... }: {
programs.git = {
    enable = true;
    userName = "Andreas Taenzer";
    userEmail = "andreas.h.taenzer@dartmouth.edu";
	};
}
