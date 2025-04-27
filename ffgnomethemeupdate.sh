#!/bin/bash

printf "\ncheck https://github.com/rafaelmardojai/firefox-gnome-theme before proceeding\n"
read -p "proceed? (y/N) " -n 1 -r
printf "\n\n"
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [[ $OSTYPE == "linux-gnu" ]]; then
        PROFILE=$(ls -l $HOME/.mozilla/firefox/ | grep default-release | awk '{print $NF}')
        if [[ -d $HOME/.mozilla/firefox/$PROFILE/chrome/firefox-gnome-theme ]]; then
            git_dir="$HOME/.mozilla/firefox/$PROFILE/chrome/firefox-gnome-theme/"
        else
            printf "firefox-gnome-theme not installed\n"
        fi
    elif [[ $OSTYPE == "darwin"* ]]; then
        if [[ -z $(ls $HOME/appsupport) ]]; then
            ln -sf $HOME/Library/Application Support/ $HOME/appsupport
        fi
        PROFILE=$(ls -l $HOME/appsupport/Firefox/Profiles/ | grep default-release | awk '{print $NF}')
        if [[ -d $HOME/appsupport/Firefox/Profiles/$PROFILE/chrome ]]; then
            git_dir="$HOME/Library/Application\ Support/Firefox/Profiles/$PROFILE/chrome"
        else
            printf "firefox-gnome-theme not installed\n"
        fi
    else
        printf "unsupported OS\n"
    fi
    git -C $git_dir pull
else
    printf "aborted\n"
fi
printf "\n"
printf "check https://github.com/rafaelmardojai/thunderbird-gnome-theme before proceeding\n"
read -p "proceed (y/N) " -n 1 -r
printf "\n\n"
if [[ $REPLY =~ ^[Yy]$ && -d $HOME/builds/thunderbird-gnome-theme/ ]]; then
    git_dir="$HOME/builds/thunderbird-gnome-theme/"
    git -C $git_dir pull
    /bin/bash $HOME/builds/thunderbird-gnome-theme/scripts/install.sh
else
    printf "thunderbird gnome theme not installed\n\n"
fi
