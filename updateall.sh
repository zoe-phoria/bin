#!/bin/bash

# welcome message

printf '\n'
echo Updating all packages
printf '\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" 'pacman' | tr ' ' =
printf '\n'

# update pacman

sudo pacman -Syu

# seperator

printf '\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" 'aur' | tr ' ' =
printf '\n'

# udpate AUR

yay -Sua

# finish line

printf '\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
printf '\n'
echo All updates complete
printf '\n'
