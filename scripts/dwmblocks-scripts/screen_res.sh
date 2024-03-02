#!/bin/sh

# 2560x1440 (0x58) 586.580MHz +HSync -VSync *current +preferred
#       h: width  2560 start 2568 end 2600 total 2640 skew    0 clock 222.19KHz
#       v: height 1440 start 1503 end 1511 total 1543           clock 144.00Hz

xrandr --newmode "2560x1440_144" 586.58 2560 2568 2600 2640 1440 1503 1511 1543 +HSync -VSync
xrandr --addmode DisplayPort-0 "2560x1440_144"
xrandr --output DisplayPort-0 --mode "2560x1440_144"

exit 0
