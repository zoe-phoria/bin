#!/bin/bash

# check if output is a terminal
if [ -t 1 ]; then
    printf "please run this script with nohup (nohup ./backup_music.sh &)\n"
    exit 1;
fi

SOURCE=/volume1/music
TARGET=/volumeUSB1/usbshare
DISKLABEL=$(cat /etc/mtab | grep usbshare | awk '{print $1}')
SIZE=$(du -sL /volume1/files | awk '{print $1}')
AVAIL=$(df $DISKLABEL --output=avail | tail -n 1)

if [[ -f $TARGET/music.dummy ]] && (( $SIZE < $AVAIL )); then
    rsync -av --chmod=D777,F766 --exclude '#recycle' $SOURCE ${TARGET}/music/ >> "${TARGET}/rsync_log_$(date +"%Y-%m-%d_%H-%M")"
elif [[ -f $TARGET/music.dummy ]]; then
    printf "not enough space\n"
    exit 1
else
    printf "music.dummy missing (wrong drive attached)\n"
    exit 1
fi
