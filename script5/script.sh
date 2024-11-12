#!/bin/bash
echo "STARTING SCRIPT"
DIRECTORY="/home/ubuntu/folder"

if [ ! -d "$DIRECTORY" ]; then
    echo "$DIRECTORY does not exist"
    exit 1
else    
    find "$DIRECTORY" -type f -mtime +30 -exec rm {} \;
    echo "DELETED FILES OLDER THAN 30 DAYS INSIDE DIRECTORY: $DIRECTORY"
fi
