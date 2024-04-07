#!/bin/bash

echo
echo "check https://github.com/rafaelmardojai/firefox-gnome-theme before proceeding"
read -p "proceed? (y/N) " -n 1 -r
echo
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  PROFILE=$(ls -l $HOME/.mozilla/firefox/ | grep default-release | awk '{print $NF}')
  cd /home/zoe/.mozilla/firefox/$PROFILE/chrome/firefox-gnome-theme/
  git pull
fi
echo
