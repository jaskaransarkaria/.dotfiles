#!/bin/sh

amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/"

exit 0
