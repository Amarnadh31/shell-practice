#!/bin/bash

LOGS_FOLDER="/var/logs/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
DATE=$(date +%Y-%m-%d_%T)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$DATE.log"

sudo mkdir -p $LOGS_FOLDER


USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USER_ID -ne 0 ]
    then
        echo -e "$R please run with root user $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is ...$R FAILED $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 is ...$G SUCCESS..$N" | tee -a $LOG_FILE
    fi
}

CHECK_ROOT


for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.." | tee -a $LOG_FILE
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed..nothing to do" | tee -a $LOG_FILE
    fi
done
