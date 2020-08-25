#!/bin/bash

# dwm start up script

# Set monitor to be the left of the laptop screen
xrandr --output HDMI-1 --mode 2560x1440 --left-of eDP-1

# Remap capslock to ctrl
setxkbmap -option "ctrl:nocaps"

# run dwm
exec dwm

# Set date
#while true; do
  #xsetroot -name $(echo date | awk '{print $1" " $2" " $3}' | Batt: upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')
 # sleep 10s #update every 10 secs	
#done &
