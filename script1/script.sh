#!/bin/bash
####################################################################################
#               SHELL SCRIPT TO GET PID OF PROCESS:"migration"
####################################################################################
# Author: Abhishek Swarnakar
# Date: 07-11-24
# Version: V1

set -x
set -e
set -o pipefail

ps -ef | grep migration | awk -F"" '{print $2}'