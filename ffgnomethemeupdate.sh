#!/bin/bash

echo
echo "check https://github.com/rafaelmardojai/firefox-gnome-theme before proceeding"
read -p "proceed? (y/N) " -n 1 -r
echo
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  cd /home/zoe/.mozilla/firefox/ee4c2w41.default-release/chrome/firefox-gnome-theme/
  git pull
fi
echo
