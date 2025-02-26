#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"


CHECK_ROOT(){
    if [ $userid -ne 0 ]
    then
       echo "please run this script through root priviliges"
       exit 1     #shell script will come out of the program
    fi
}

VALIDATE(){
     if [ $1 -ne 0 ]
     then  
         echo -e "$2 is ...$R failed $N"
         exit 1
     else 
         echo -e "$2 is ....$G success $N"
     fi
}

CHECK_ROOT


for package in $@   #refers to all arguments passed to it.
do
  dnf list installed $package
  if [ $? -ne 0 ]
  then
     echo "$package is not installed,going to install it.."
     dnf install $package -y
     VALIDATE $? "INSTALLING $package"
  else
     echo "$package is already installed...nothing to do"
  fi
done


