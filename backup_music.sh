#!/bin/sh

# check if output is a terminal
if [ -t 1 ]; then
    printf "please run this script with nohup (nohup ./backup_music.sh &)\n"
    exit 1;
fi

SOURCE=/volume1/music
TARGET=/volumeUSB1/usbshare

rsync -avb --chmod=D766,F766 --chown=zoe:users --delete-after --backup-dir=${TARGET}/rsync_backup --exclude '#recycle' $SOURCE ${TARGET}/music/ >> "${TARGET}/rsync_log_$(date +"%Y-%m-%d_%H-%M")"
