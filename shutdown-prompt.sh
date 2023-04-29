#!/bin/bash

read -p "shutdown now? (y/N) " -n 1 -r ans
echo

if [[ $ans =~ ^[Yy]$ ]]
then
  echo "shutting down"
  systemctl poweroff
else
  exit
fi
