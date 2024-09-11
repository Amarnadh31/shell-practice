#!/bin/bash

echo "All the variable indiacated with $@"
echo " number of variables passed now : $#"
echo " script name : $0"
echo " current working directory $PWD"
echo " home directory of current user $HOME"
echo " pID of the current script : $$"
sleep 100 &
echo "PID of the last background process : $!"