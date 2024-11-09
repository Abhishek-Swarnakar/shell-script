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
    echo "STOPPING THE CONTAINER!!!"
    docker stop $containerId

    if[$? -eq 0]; then
        echo "DELETEING THE CONTAINER!!!"
        docker rm $containerId
    else
        echo "NO CONTAINER STOPPED!!"
    fi
else
    echo "NO CONTAINER RUNNING!!!"
fi
    
