{ pkgs, lib, config, ... }: {
programs.git = {
    enable = true;
    userName = "Andreas Taenzer";
    userEmail = "andreas.h.taenzer@dartmouth.edu";
    signing = {
        key = "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";
        signByDefault = true;
    };
};
}
