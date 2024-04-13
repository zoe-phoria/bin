#!/bin/bash

case $(lscpu --parse=MODELNAME | tail -n 1 | awk {'print $1 $2 $3 $4'}) in

    "Intel(R)Pentium(R)CPU4415Y")
        DEVICE=".surface"
    ;;

    "Intel(R)Core(TM)i7-4700MQCPU")
        DEVICE=".ms-16gc"
    ;;

    "Intel(R)Core(TM)i7-7700KCPU")
        DEVICE=".desktop"
    ;;

    *)
        printf "unknown device, not uploading package lists\n"
        exit 1
    ;;

esac


if [[ -d "/mnt/files/Software" ]] 
then
    /usr/bin/pacman -Qqn > /mnt/files/Software/pacman/pkglist$DEVICE.txt
    /usr/bin/pacman -Qqetn > /mnt/files/Software/pacman/nodependpkglist$DEVICE.txt 
    /usr/bin/pacman -Qqem > /mnt/files/Software/pacman/foreignpkglist$DEVICE.txt
    /usr/bin/flatpak list > /mnt/files/Software/pacman/flatpakpkglist$DEVICE.txt
    printf "\033[01;34m::\033[0m package lists updated\n"
else
    printf "\033[01;34m::\033[0m host 'ds718p' (192.168.0.3) is down\n"
    printf "\033[01;34m::\033[0m package lists not updated\n"
fi
