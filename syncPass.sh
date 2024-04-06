#!/bin/bash

if [[ $OSTYPE == "linux-gnu" ]]; then
    SOURCE=/mnt/files/passwords.kdbx
    DEST=/mnt/SSD1000/passwords.kdbx
elif [[ $OSTYPE == "darwin"* ]]; then
    SOURCE=/Volumes/files/passwords.kdbx
    DEST=/Users/zoe/passwords.kdbx
else
    exit 1
fi

if [[ -f $SOURCE ]]; then
    date +"%Y-%m-%d_%H-%M" >> .syncPass.log
    cp -v  $SOURCE $DEST >> .syncPass.log
    rm $HOME/.sync.err &>/dev/null
else
    printf "$(date +"%Y-%m-%d_%H-%M"): database file not found; syncPass unsuccessful; is ds718p connected?\n" >> $HOME/.sync.err
fi
