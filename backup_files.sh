#!/bin/sh

# check if output is a terminal
if [ -t 1 ]; then
    printf "please run this script with nohup\n"
    exit 1
fi

SOURCE=/volume1/files
TARGET=/volumeUSB1/usbshare
DISKLABEL=$(cat /etc/mtab | grep usbshare | awk '{print $1}')
SIZE=$(du -sL /volume1/files | awk '{print $1}')
AVAIL=$(btrfs filesystem df $DISKLABEL --output=avail | tail -n 1)

printf "copy size:      $SIZE\n"
printf "available size: $AVAIL\n"

if [[ -f $TARGET/files.dummy ]] && (( $SIZE < $AVAIL )); then
    printf "creating backup $(date +"%Y-%m-%d_%H-%M")\n"
    rsync -av --chmod=D777,F766 $SOURCE ${TARGET}/files_$(date +"%Y-%m-%d_%H-%M") >> "$TARGET/rsync_log_$(date +"%Y-%m-%d_%H-%M")"
elif [[ -f $TARGET/files.dummy ]]; then
    printf "not enough space\n"
else
    printf "files.dummy missing (wrong drive attached)\n"
fi
