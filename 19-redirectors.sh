#!/bin/bash

LOGS_FOLDER="/var/logs/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
DATE=$(date +%Y-%m-%d_%T)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$DATE.log"

mkdir -p $LOGS_FOLDER


USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USER_ID -ne 0 ]
    then
        echo -e "$R please run with root user $N"
        exit 1
}