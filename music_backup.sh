#!/bin/bash

SOURCE=/mnt/music
TARGET=/mnt/music_backup
BACKUP=/mnt/music_backup
BANDWIDTH=10000 #kBps

# archive mode, verbose, backup mode, show progress, delete after completion, exclude #recycle
rsync -avb --progress --delete-after --backup-dir=$BACKUP --exclude '#recycle' --bwlimit=$BANDWIDTH $SOURCE $TARGET >> "/mnt/music_backup/rsync_log_$(date)"
