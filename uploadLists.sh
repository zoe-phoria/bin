#!/bin/bash

if [[ -d "/mnt/files/Software" ]] 
then
    /usr/bin/pacman -Qqn > /mnt/files/Software/pacman/pkglist.txt
    /usr/bin/pacman -Qqetn > /mnt/files/Software/pacman/nodependpkglist.txt 
    /usr/bin/pacman -Qqem > /mnt/files/Software/pacman/foreignpkglist.txt
    /usr/bin/flatpak list > /mnt/files/Software/pacman/flatpakpkglist.txt
    printf "\033[01;34m::\033[0m package lists updated\n"
else
    printf "\033[01;34m::\033[0m host 'ds718p' (192.168.0.3) is down\n"
    printf "\033[01;34m::\033[0m package lists not updated\n"
fi
