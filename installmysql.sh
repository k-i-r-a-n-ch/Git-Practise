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
    if [ $? -ne 0 ]
    then
        echo "Git installation is not successful...check it"
        exit 1
    else
        echo "Git installation is success"
    fi
else
    echo "git is already installed... nothing to do"
fi


dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "MYSQL is not installed....going to install"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "MYSQL installation is failure....please check"
        exit 1
    else
        echo "MYSQL installation is success"
    fi
else
    echo "MYSQL is alraedy installed...nothing to do"
fi