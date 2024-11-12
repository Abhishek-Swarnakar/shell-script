#!/bin/bash
echo "STARTING SCRIPT"
DIRECTORY="/home/ubuntu/folder"

if [ ! -d "$DIRECTORY" ]; then
    echo "$DIRECTORY does not exist"
    exit 1
fi
OLDFILES=$(find "$DIRECTORY" -type -f -mtime +30)  
if [ -n "$OLDFILES" ]; then
    echo "$OLDFILES" | xargs rm
    echo "DELETED FILES OLDER THAN 30 DAYS INSIDE DIRECTORY: $DIRECTORY"
else
    "NO FILES GREATER THAN 30 DAYS!!"
fi
