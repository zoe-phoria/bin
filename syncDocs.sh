#!/bin/bash

if [[ $OSTYPE == "linux-gnu" ]]; then
    SOURCE=/mnt/files/Documents/
    if [[ -d /mnt/SSD1000/ ]]; then
        DEST=/mnt/SSD1000/DocumentsBackup/
        DEL=/mnt/SSD1000/DocumentsDeleted/
    elif [[ -d /mnt/sdcard/ ]]; then
        DEST=/mnt/sdcard/DocumentsBackup/
        DEL=/mnt/sdcard/DocumentsDeleted/
    else
        DEST=$HOME/DocumentsBackup
        DEL=$HOME/DocumentsDeleted
    fi
elif [[ $OSTYPE == "darwin"* ]]; then
    SOURCE=/Volumes/files/Documents/
    DEST=$HOME/DocumentsBackup/
    DEL=$HOME/DocumentsDeleted/
else
    printf "$(date +"%Y-%m-%d_%H-%M"): unsupported operating system\n" >> $HOME/.sync.err
    exit 1
fi

if [[ -f $SOURCE/../passwords.kdbx ]]; then
    rsync -a -E -v --delete -b --backup-dir=$DEL -P --stats $SOURCE $DEST > $HOME/.syncDocs.log
    printf "$(date +"%Y-%m-%d_%H-%M"): ran rsync from $SOURCE to $DEST\n" >> $HOME/.syncDocs.log
    rm $HOME/.sync.err &>/dev/null
else
    printf "$(date +"%Y-%m-%d_%H-%M"): passwords.kdbx not found; syncDocs unsuccessful; is ds718p connected?\n" >> $HOME/.sync.err
fi
