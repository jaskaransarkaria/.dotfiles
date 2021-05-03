#!/bin/sh

VOL_STATUS=$(amixer get Master | grep 'Right:' | awk -F'[][]' '{ print $4 }')
VOL_VAL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")

case $VOL_STATUS in

  on)
    echo -n "🔉 $VOL_VAL"
    ;;

  *)
    echo -n "🔇"
    ;;
esac

exit 0
