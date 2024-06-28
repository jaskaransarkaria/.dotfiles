#!/bin/sh

set -ex

while true
do
  if [ $(grep -r "RUNNING" /proc/asound | wc -l) -eq 0 ]; then
    # lock screen
    xautolock -time 10 -locker slock &
  else
    # sound playing so kill lock
    ps -e | grep xautolock | awk '{print $1}' | xargs -n 1 | xargs -I % kill %
  fi
done
