#!/bin/bash

set -e

HALL=192.168.222.138
LIVING_ROOM=192.168.222.222
KITCHEN=192.168.222.188

SERVERS=($HALL $LIVING_ROOM $KITCHEN)

for server in "${SERVERS[@]}"; do
    curl -G -S -s --data-urlencode "cmd=trx_control -rx Off" "http://$server/command/"
    curl -G -S -s --data-urlencode "cmd=trx_control -rx On" "http://$server/command/"
done

exit 0
