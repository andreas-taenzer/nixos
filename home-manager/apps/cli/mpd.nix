{ config, lib, ... }: {

  services = {
    mpd = {
      enable = true;
      network.listenAddress = "any";
      musicDirectory = "${config.home.homeDirectory}/Music";
        extraConfig = ''
          auto_update   "yes"
          restorePaused "yes"

          audio_output {
            type "pipewire"
            name "Pipewire output"
            buffer_time "100000"
          }


        audio_output {
        	type                "fifo"
        	name                "Visualizer"
        	format              "44100:16:2"
        	path                "/tmp/mpd.fifo"
        }
        audio_output {
        	type		            "httpd"
        	name		            "lossless"
        	encoder		          "flac"
        	port		            "8000"
        	max_client	        "8"
        	mixer_type	        "software"
        	format		          "44100:16:2"
        }
        '';
      };
  };

  programs.ncmpcpp = {
    enable = true;
    
    mpdMusicDir = "${config.xdg.userDirs.music}";
    settings = {
      ncmpcpp_directory = "${config.xdg.configHome}/ncmpcpp";
      visualizer_color = "blue,39,33,93,165,201,magenta,white";
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_fps = "60";
      visualizer_in_stereo = "yes";
      visualizer_look = "●▮";
      visualizer_output_name = "Visualizer";
      visualizer_spectrum_smooth_look = "yes";
      visualizer_type = "ellipse";

      browser_display_mode = "columns";
      playlist_display_mode = "columns";
      playlist_editor_display_mode = "columns";
      search_engine_display_mode = "columns";
      user_interface = "classic";

      allow_for_physical_item_deletion = "no";
      connected_message_on_startup = "no";
      display_bitrate = "no";
      header_visibility = "no";
      statusbar_visibility = "no";
      titles_visibility = "no";

      autocenter_mode = "yes";
      centered_cursor = "yes";
      clock_display_seconds = "yes";
      cyclic_scrolling = "yes";
      follow_now_playing_lyrics = "yes";
      ignore_leading_the = "yes";
      mouse_support = "yes";
      mouse_list_scroll_whole_page = "yes";
      playlist_shorten_total_times = "yes";

      lines_scrolled = "1";
      message_delay_time = "1";
      volume_change_step = "5";

      startup_screen = "playlist";
      external_editor = "hx";

      now_playing_prefix = "$b$2$7 ";
      now_playing_suffix = "  $/b$8";
      current_item_prefix = "$b$7$/b$3 ";
      current_item_suffix = "  $8";

      song_columns_list_format = "(53)[white]{tr} (45)[blue]{a}";
      song_library_format = "{{%a - %t} (%b)}|{%f}";
      song_list_format = "  %t $R%a %l  ";
      song_status_format = "$7%t";
      song_window_title_format = "Music";

      progressbar_color = "black";
      progressbar_elapsed_color = "blue";
      progressbar_look = "▂▂▂";

      colors_enabled = "yes";
      color1 = "$color7";
      color2 = "$color8";
      main_window_color = "blue";
      statusbar_color = "white";
      volume_color = "white";
    };
  };
}
