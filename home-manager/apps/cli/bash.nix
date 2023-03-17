{
  programs.bash = {
    enable = true;
  	
    bashrcExtra = 
      # wal stuff
      "
       (cat ~/.cache/wal/sequences &)  
	source ~/.cache/wal/colors-tty.sh
	";
      };
}
