#!/bin/bash

# dwm start up script

# Set monitor to be the left of the laptop screen
xrandr --output HDMI-1 --mode 2560x1440 --left-of eDP-1

# Remap capslock to ctrl
setxkbmap -option "ctrl:nocaps"

# run dwm
exec dwm
