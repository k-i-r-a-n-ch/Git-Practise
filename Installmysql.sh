#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "Please run this script through Root priviliges" 
fi

dnf install git -y 

