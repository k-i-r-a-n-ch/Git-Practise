#!/bin/bash

userid=$(id -u)

echo "user id is :$userid"

if [ $userid -ne 0 ]
then
   echo "please run this script through root priviliges"
   exit 1     #shell script will come out of the program
fi

dnf list installed git

if [ $? -ne 0 ]
then 
    echo "git is not installed,going to install it.."
    dnf install git -y
else
    echo "git is already installed... nothing to do"
fi
