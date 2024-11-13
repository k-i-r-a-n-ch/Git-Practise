#!/bin/bash

userid=$(id -u)

echo "user id is :$userid"

if [ $userid -ne 0 ]
then
   echo "please run this script through root priviliges"
   exit 1     #shell script will come out of the program
fi

dnf install 