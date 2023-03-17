{ bspwm.sxhkdrc, ...}: ''

# Launch terminal
super + Return
	urxvt

super + shift + Return	
	kitty	

# Launch Rofi start menu
super + p
	dmenu_run

# Launch Web Browser
super + {_,shift + }w
	firefox {_,--private-window}

# Launch common apps
super + {e,g}
	{thunar,geany}

# Lockscreen
super + l
	lock

# Take a screenshot
Print
	screeny

# Take a screenshot of active window only
alt + Print
	screeny -f

# Take a screenshot with drawing manual selection
ctrl + Print
	screeny -s

# Volume control
XF86Audio{RaiseVolume,LowerVolume,Mute}
	pamixer {-i 10, -d 10, -t}

#Brightness control
XF86MonBrightness{Up,Down}
	light {-A 5,-U 5}

# Quit bspwm normally
super + shift + q
	bspc quit

# Reload bspwm config
super + shift + BackSpace
	bspc wm -r

# Close or kill app
super + shift + k
	bspc node {-c,-k}

# Close app (common way)
super + q
	bspc node -c

# Fullscreen / Monocle
super + f
	bspc desktop -l next

# Split horizontal, split vertical, or cancel
super + {h,v,r}
	bspc node -p {east,south,cancel}

# Toggle beetwen floating & tiled
super + space
	bspc node -t "~"{floating,tiled}

# Pseudo Tiled & tiled mode
super + {p,t}
	bspc node -t {pseudo_tiled,tiled}

# Send the window to another edge of the screen
super + {_,shift + }{Left,Down,Up,Right}
	bspc node -{f,s} {west,south,north,east}

# Change focus to next window, including floating window
alt + {_,shift + }Tab
	bspc node -f {next.local,prev.local}

# Switch workspace
ctrl + alt + {Left,Right}
	bspc desktop -f {prev.local,next.local}

# Switch to last opened workspace
super + {Tab,grave}
	bspc {node,desktop} -f last

# Switch to another workspace
super + {1-6}
	bspc desktop -f '^{1-6}'

# Send focused window to another workspace
super + shift + {1-6}
	bspc node -d '^{1-6}' -f

# Expanding windows
super + control + {Left,Right,Up,Down}
	bspc node -z {left -20 0,right 20 0,top 0 -20,bottom 0 20}

# Shrinking windows
super + alt + {Left,Right,Up,Down}
	bspc node -z {left 20 0,right -20 0,top 0 20,bottom 0 -20}

# Move floating windows
alt + shift + {Left,Down,Up,Right}
	bspc node -v {-20 0,0 20,0 -20,20 0}


''	
