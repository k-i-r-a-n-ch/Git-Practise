#!/bin/bash


USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo "$2 is....FAILED"
    else
        echo "$2 is....SUCCESS"
    fi
}

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
    VALIDATE $? "Installing GIT"
else
    echo "Git is Already Installed..."
fi


dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySql is not installed...going to install it"
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else
    echo "MYSQL is already installed.... nothing to do"
fi