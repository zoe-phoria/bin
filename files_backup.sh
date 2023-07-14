#!/bin/bash

SOURCE=/mnt/files
TARGET="/mnt/files_backup/files_1_$(date +%Y-%m-%d)"
BANDWIDTH=10000 #kBps

# delete oldest version
if [ -d /mnt/files_backup/files_3_* ]; then
  printf "deleting oldest version\n"
  rm -rf /mnt/files_backup/files_3_*
fi

# rename 2nd version
if [ -d /mnt/files_backup/files_2_* ]; then
  printf "renaming 2nd most recent version\n"
  datsuf=$(find /mnt/files_backup/ -maxdepth 1 -name files_2_*)
  datsuf=${datsuf:26}
  mv /mnt/files_backup/files_2_* /mnt/files_backup/files_3_$datsuf
  unset $datsuf
fi

# rename 1st version
if [ -d /mnt/files_backup/files_1_* ]; then
  printf "renaming most recent version\n"
  datsuf=$(find /mnt/files_backup/ -maxdepth 1 -name files_1_*)
  datsuf=${datsuf:26}
  mv /mnt/files_backup/files_1_* /mnt/files_backup/files_2_$datsuf
  unset $datsuf
fi

# create new version
printf "creating new version\n"
(set -m; nohup rsync --verbose --archive --progress --exclude '#recycle' --bwlimit=$BANDWIDTH $SOURCE $TARGET >> "/mnt/files_backup/rsync_log_$(date +%Y-%m-%d)" & )
tail +1f "/mnt/files_backup/rsync_log_$(date +%Y-%m-%d)"
