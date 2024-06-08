#!/bin/bash

if [[ ! -f "/usr/bin/pacman" ]]; then
    printf "\033[01;34m::\033[0m unsupported os\n"
    exit 1
fi

if [[ -d "/mnt/files/Software" ]]
then
    /usr/bin/pacman -Qqn > /mnt/files/Software/pacman/pkglist.$(cat /etc/hostname).txt
    /usr/bin/pacman -Qqetn > /mnt/files/Software/pacman/nodependpkglist.$(cat /etc/hostname).txt 
    /usr/bin/pacman -Qqem > /mnt/files/Software/pacman/foreignpkglist.$(cat /etc/hostname).txt
    printf "\033[01;34m::\033[0m package lists updated\n"
else
    printf "\033[01;34m::\033[0m host 'ds718p' (192.168.0.3) is down\n"
    printf "\033[01;34m::\033[0m package lists not updated\n"
    exit 1
fi
