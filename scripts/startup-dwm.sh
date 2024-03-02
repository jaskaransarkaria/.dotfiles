#!/bin/sh

# dwm start up script

# Set monitor to be the left of the laptop screen
xrandr --output HDMI-1 --mode 2560x1440 --left-of eDP-1 --refresh 144

# Remap capslock to ctrl
setxkbmap -option "ctrl:nocaps"

# Start Compositor for windows
# compton &
picom --daemon

# Start Notification daemon
dunst &

feh --bg-scale /home/jaskaran/utils/.dotfiles/scripts/.1920_1080_colours_wallpaper.png
exec dwmblocks &
# run dwm
dbus-launch --sh-syntax --exit-with-x11 dwm

