#!/bin/bash

######################################################################################################################
#               SHELL SCRIPT TO GET DOCKER CONTAINER ID TO STOP AND REMOVE CONATINER IF ANY CONTAINER IS RUNNING
######################################################################################################################
# Author: Abhishek Swarnakar
# Date: 07-11-24
# Version: V1
######################################################################################################################

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
    
