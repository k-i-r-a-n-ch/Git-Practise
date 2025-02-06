#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "Please run this script through Root priviliges" 
   exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not installed , going to install it.."
    dnf install git -y
    if [ $? -ne 0 ]
    then
       echo "Git installation is not success check it ..."
       exit 1
    else 
       echo "Git Installation is Success"
else 
    echo "Git is Already installed"
