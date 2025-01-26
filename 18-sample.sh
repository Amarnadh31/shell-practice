#!/bin/bash

if [ $(id -u) -ne 0 ]
then
    echo "kindly run with root user"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "my sql not installed...Installing"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "mysql installation failed.."
        exit 1
    else
        echo "mysql installed successfully.."
else
    echo "mysql is already installed, nothing to do..."
fi





