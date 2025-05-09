#!/bin/bash
# restart librespot.service by the push of a button (BCM pin 5 to ground) (run as root)

raspi-gpio set 5 ip
raspi-gpio set 5 pu

function button_loop()
{
    STATE=$(raspi-gpio get 5)
    STATE=${STATE:14:1}
    if [[ $STATE == 0 ]]; then
        printf "button pressed\n"
        systemctl --user -M zoe@ restart librespot.service
        sleep 10
    fi
    sleep 1
}

while true; do
    button_loop
done
