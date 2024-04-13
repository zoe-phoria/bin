#!/bin/bash

if [[ $OSTYPE == "linux-gnu" ]]; then
    SOURCE=/mnt/files/passwords.kdbx
    if [[ -d /mnt/SSD1000/ ]]; then
        DEST=/mnt/SSD1000/passwords.kdbx
    elif [[ -d /mnt/sdcard/ ]]; then
        DEST=/mnt/sdcard/passwords.kdbx
    else
        DEST=$HOME/passwords.kdbx
    fi
elif [[ $OSTYPE == "darwin"* ]]; then
    SOURCE=/Volumes/files/passwords.kdbx
    DEST=$HOME/passwords.kdbx
else
    printf "$(date +"%Y-%m-%d_%H-%M"): unsupported operating system\n" >> $HOME/.sync.err
    exit 1
fi

if [[ -f $SOURCE ]]; then
    date +"%Y-%m-%d_%H-%M:" >> $HOME/.syncPass.log
    cp -v  $SOURCE $DEST >> $HOME/.syncPass.log
    rm $HOME/.sync.err &>/dev/null
else
    printf "$(date +"%Y-%m-%d_%H-%M"): database file not found; syncPass unsuccessful; is ds718p connected?\n" >> $HOME/.sync.err
fi
