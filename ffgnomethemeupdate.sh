#!/bin/bash

printf "\ncheck https://github.com/rafaelmardojai/firefox-gnome-theme before proceeding\n"
read -p "proceed? (y/N) " -n 1 -r
printf "\n\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
    if [[ $OSTYPE == "linux-gnu" ]]; then
        PROFILE=$(ls -l $HOME/.mozilla/firefox/ | grep default-release | awk '{print $NF}')
        cd $HOME/.mozilla/firefox/$PROFILE/chrome/firefox-gnome-theme/
    elif [[ $OSTYPE == "darwin"* ]]; then
        if [[ -z $(ls $HOME/appsupport) ]]; then
            ln -sf $HOME/Library/Application Support/ $HOME/appsupport
        fi
        PROFILE=$(ls -l $HOME/appsupport/Firefox/Profiles/ | grep default-release | awk '{print $NF}')
        cd $HOME/Library/Application\ Support/Firefox/Profiles/$PROFILE/chrome
    else
        printf "unsupported OS\n"
    fi
    git pull
fi
printf "\n"
