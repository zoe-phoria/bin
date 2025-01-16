#!/bin/bash

printf "\ncheck https://github.com/rafaelmardojai/firefox-gnome-theme before proceeding\n"
read -p "proceed? (y/N) " -n 1 -r
printf "\n\n"
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [[ $OSTYPE == "linux-gnu" ]]; then
        PROFILE=$(ls -l $HOME/.mozilla/firefox/ | grep default-release | awk '{print $NF}')
        cd $HOME/.mozilla/firefox/$PROFILE/chrome/firefox-gnome-theme/ || { printf "ffgnometheme not installed\n"; }
    elif [[ $OSTYPE == "darwin"* ]]; then
        if [[ -z $(ls $HOME/appsupport) ]]; then
            ln -sf $HOME/Library/Application Support/ $HOME/appsupport
        fi
        PROFILE=$(ls -l $HOME/appsupport/Firefox/Profiles/ | grep default-release | awk '{print $NF}')
        cd $HOME/Library/Application\ Support/Firefox/Profiles/$PROFILE/chrome || { printf "ffgnometheme not installed\n"; }
    else
        printf "unsupported OS\n"
    fi
    if [[ -n $(git status --porcelain) ]]; then
        git pull
    else
        printf "Already up to date.\n"
    fi
else
    printf "aborted\n"
fi
printf "\n"
printf "check https://github.com/rafaelmardojai/thunderbird-gnome-theme before proceeding\n"
read -p "proceed (y/N) " -n 1 -r
printf "\n\n"
if [[ $REPLY =~ ^[Yy]$ && -d $HOME/builds/thunderbird-gnome-theme/ ]]; then
    cd $HOME/builds/thunderbird-gnome-theme/
    if [[ -n $(git status --porcelain) ]]; then
        git pull
        /bin/bash $HOME/builds/thunderbird-gnome-theme/scripts/auto-install.sh
    else
        printf "Already up to date.\n\n"
    fi
else
    printf "thunderbird gnome theme not installed\n\n"
fi
