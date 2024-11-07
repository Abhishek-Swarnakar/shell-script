#!/bin/bash

set -e

containerId=$(docker ps -q)
if [-n "$containerId"]; then
    echo "STOPPING CONTAINER!!"
    docker stop $containerId

    if [$? -eq 0]
        echo "REMOVING CONTAINER!!"
        docker rm $containerId
    else
        echo "FAILED TO REMOVE CONTAINER!!"
    fi
else
    echo "NO CONATINER TO STOP!!"
fi
    
