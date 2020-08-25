#!/bin/bash

# dwm start up script

# Set monitor to be the left of the laptop screen
xrandr --output HDMI-1 --mode 2560x1440 --left-of eDP-1

# Remap capslock to ctrl
setxkbmap -option "ctrl:nocaps"

# Status bar
# date
while true; do
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    if [ "$STATUS" = "Charging" ]; then
            BATT_STATE="🔌 $CHARGE $STATUS"
    else
            BATT_STATE="🔋 $CHARGE $STATUS"
    fi 
    xsetroot -name " $(date) |"
done &

# run dwm
exec dwm

# Set date
#while true; do
#  xsetroot -name $(echo date | awk '{print $1" " $2" " $3}' | Batt: upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')
 # sleep 10s #update every 10 secs	
#done &
