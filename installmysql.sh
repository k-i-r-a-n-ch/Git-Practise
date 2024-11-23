#!/bin/bash


USERID=$(id -u)

#echo "USERID is $USERID"

if[ $USERID -ne 0 ]
then 
    echo "Please Run This Script Through Root Priviliges"
fi

dnf install git -y


