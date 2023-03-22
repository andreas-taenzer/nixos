{ config, pkgs, ... }: {
  xsession.windowManager.bspwm = {
    enable = true;
    extraConfigEarly = ''

    # Bspwm configurations
	bspc monitor -d 1 2 3 4 5 6 
	bspc config focus_follows_pointer true
	bspc config left_padding 120 
	bspc config border_width 4
	bspc config window_gap 20

	. "$HOME/.cache/wal/colors.sh"


	# Set the border colors.
	#spc config normal_border_color "$color1"
	#bspc config active_border_color "$color2"
	#bspc config focused_border_color "$color15"
	#bspc config presel_feedback_color "$color1"

	bspc config focused_border_color "$background"
	bspc config normal_border_color  "$background"
	bspc config active_border_color  "$foreground"
	bspc config presel_feedback_color "$color2"

	bspc config borderless_monocle true
	bspc config gapless_monocle true
	bspc config single_monocle true

	# Window rules
	# bspc rule -r *:*
	bspc rule -a kitty desktop=^1 follow=on focus=on
	bspc rule -a Firefox desktop=^3 follow=on focus=on
	#bspc rule -a Transmission-gtk desktop=^3 follow=on focus=on
	#bspc rule -a thunar desktop=^4 follow=on focus=on
	bspc rule -a Firefox:Places state=floating follow=on focus=on desktop='^3'

	## tunes
	bspc rule -a urxvt desktop=^2 follow=on focus=on
	bspc rule -a URxvt:cava state=floating rectangle=1300x600+2500+1000 desktop=5
	bspc rule -a URxvt:ncmpcpp state=floating rectangle=1300x800+2500+100 desktop=^5
	bspc rule -a Pavucontrol state=floating desktop=^2

	### autostart
	pgrep -x sxhkd > /dev/null || sxhkd -c ~/.config/sxhkd/sxhkdrc &
	pgrep -x eww > /dev/null || eww open bar &
	#killall polybar; sleep 1 &
	#polybar -q minimal &
	'';
	};
}
