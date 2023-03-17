{ config, lib, ... }: {

  services.mpd = {
    enable = true;
    network.listenAddress = "any";
    musicDirectory = "${config.home.homeDirectory}/Music";
    extraConfig = ''
    type "pipewire"
        name "My Pipewire output"
      }
    '';
  };

}
