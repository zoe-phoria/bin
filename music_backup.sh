#!/bin/bash

SOURCE=/mnt/music
TARGET=/mnt/music_backup
BACKUP=/mnt/music_backup
BANDWIDTH=10000 #kBps

# archive mode, verbose, backup mode, show progress, delete after completion, exclude #recycle
# run in [(subshell)] and create new process grounp [set -m] to make it immune to SIGINT etc
(set -m; nohup rsync -avb --progress --delete-after --backup-dir=$BACKUP --exclude '#recycle' --bwlimit=$BANDWIDTH $SOURCE $TARGET >> "/mnt/music_backup/rsync_log_$(date)" & )
# show output
tail +1f "/mnt/music_backup/rsync_log_$(date)"
