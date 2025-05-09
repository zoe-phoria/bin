#!/bin/bash

raspi-gpio set 5 ip
raspi-gpio set 5 pu

function button_loop()
{
    STATE=$(raspi-gpio get 5 | awk -F "[= ]" '{print $4}')
    if [[ $STATE == 0 ]]; then
        printf "button pressed\n"
        systemctl --user -M zoe@ restart librespot.service
        sleep 5
    fi
}

while true; do
    button_loop
done
