#!/bin/bash

num1=$1
num2=$2

sum=$(($num1+$num2))

echo "sum of $num1 and $num2 is ${sum}"

echo "total variables $@"
echo "aruguments passed to the script $#"
echo "present process $$"

echo "script name $0"
sleep 30 &
echo "previous process $!"
