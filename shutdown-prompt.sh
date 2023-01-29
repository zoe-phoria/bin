#!/bin/bash

read -p "shutdown now? (y/N) " -n 1 -r ans
echo

if [[ $ans =~ ^[Yy]$ ]]
then
  echo "shutting down"
  sudo umount /mnt/files
  sudo umount /mnt/music
  shutdown 0
else
  exit
fi
