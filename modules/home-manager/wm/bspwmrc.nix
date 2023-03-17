{ bspwmrc, ... }: ''
#!/bin/bash

# Bspwm configurations
bspc monitor -d 1 2 3 4 5 6 
bspc config focus_follows_pointer true
bspc config top_padding 50 
bspc config border_width 4
bspc config window_gap 20
bspc config focused_border_color "#98c379"
bspc config normal_border_color "#3e4452"
bspc config active_border_color "#e06c75"
bspc config presel_feedback_color "#56b6c2"
bspc config borderless_monocle true
bspc config gapless_monocle true
bspc config single_monocle true

# Window rules
# bspc rule -r *:*
#bspc rule -a kitty desktop=^1 follow=on focus=on
bspc rule -a Firefox desktop=^3 follow=on focus=on
#bspc rule -a Transmission-gtk desktop=^3 follow=on focus=on
#bspc rule -a thunar desktop=^4 follow=on focus=on
#bspc rule -a Firefox:Places state=floating follow=on focus=on desktop='^3'

## tunes
i#bspc rule -a URxvt desktop=^2 follow=on focus=on
bspc rule -a URxvt:cava state=floating rectangle=1300x600+2500+1000 desktop=^2
bspc rule -a URxvt:ncmpcpp state=floating rectangle=1300x800+2500+100 desktop=^2
bspc rule -a Pavucontrol state=floating desktop=^2

### autostart
pgrep -x sxhkd > /dev/null || sxhkd -c ~/.config/bspwm/sxhkdrc &

# Run EWW.
#eww -c $HOME/.config/eww/leftbar --restart open leftbar &

# Run notification daemon.
dunst --config $HOME/.config/dunst/dunstrc &

# Run Picom.
#picom --config $HOME/.config/picom/picom.conf &

##
xrdb -merge ~/.Xresources
xrandr --dpi 192

#pkill polybar &
#$HOME/.config/polybar/launch.sh &
#eww open bar &

''
