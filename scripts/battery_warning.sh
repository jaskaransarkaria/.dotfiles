#!/bin/bash
set -e

BATT_CHARGE=$1

if [ $((BATT_CHARGE < 25)) = 1 ]; then
	cvlc /home/jaskaran/.dotfiles/scripts/makaveli_hail_mary_battery_warning.mp3 "vlc://quit"
fi
exit 0
