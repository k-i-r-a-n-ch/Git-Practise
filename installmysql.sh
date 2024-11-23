#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please Run This Script Through Root Priviliges"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it..."
    dnf install git -y
    if [ $? -ne 0 ]
    then  
        echo "Git installation is not success....check it"
    else
       echo "Git installation is success..."
    fi
else
    echo "Git is Already Installed..."
fi


dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySql is not installed...going to install it"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "MYsql installation is failure...please check"
        exit 1
    else
        echo "mysql insatallation is success"
    fi
else
    echo "MYSQL is already installed.... nothing to do"
fi