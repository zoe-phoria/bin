#!/bin/bash

read -p "shutdown/logout/reboot now? (y/l/r/N) " -n 1 -r ans
echo

case $ans in
  "y"|"Y")
    systemctl poweroff
    ;;
  "l"|"L")
    i3-msg exit
    ;;
  "r"|"R")
    systemctl reboot
    ;;
  *)
    exit
    ;;
esac
