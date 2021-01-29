#!/bin/zsh
export EDITOR=nvim
export TERMINAL=st
export BROWSER=firefox-developer-edition
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
