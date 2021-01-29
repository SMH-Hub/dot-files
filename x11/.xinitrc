#!/bin/zsh
setxkbmap -layout gb &
xset r rate 300 50 &
xcompmgr &
dunst &
unclutter &
random_bg &
dwmblocks &
dwm 2> ~/.dwm.log
