#!/bin/bash

# dwm start up script

# Set monitor to be the left of the laptop screen
xrandr --output HDMI-1 --mode 2560x1440 --left-of eDP-1 --refresh 144

# Remap capslock to ctrl
setxkbmap -option "ctrl:nocaps"

# Start Compositor for windows
compton &

# Start Notification daemon
dunst &

# Status bar
# date
while true; do
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    VOL_STATUS=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    BATT_STATUS=$(cat /sys/class/power_supply/BAT0/status)
    NOW=$(date +"%m-%d-%Y %H:%M")
    if [ "$BATT_STATUS" = "Charging" ]; then
            BATT_STATE=" $CHARGE $BATT_STATUS"
    else
            BATT_STATE="  $CHARGE $BATT_STATUS"
	    /home/jaskaran/.dotfiles/scripts/battery_warning.sh $CHARGE &
    fi 
    xsetroot -name " $NOW | $BATT_STATE |  $VOL"
    sleep 10
done &

feh --bg-scale /home/jaskaran/.scripts/.1920_1080_colours_wallpaper.png

# run dwm
exec dwm

# Set date
#while true; do
#  xsetroot -name $(echo date | awk '{print $1" " $2" " $3}' | Batt: upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')
 # sleep 10s #update every 10 secs	
#done &
