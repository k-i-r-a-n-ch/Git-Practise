#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER

userid=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


CHECK_ROOT(){
    if [ $userid -ne 0 ]
    then
       echo -e "$R please run this script through root priviliges $N" &>>$LOG_FILE
       exit 1     #shell script will come out of the program
    fi
}

VALIDATE(){
     if [ $1 -ne 0 ]
     then  
         echo -e "$2 is ...$R failed $N"  &>>$LOG_FILE
         exit 1
     else 
         echo -e "$2 is ....$G success $N"  &>>$LOG_FILE
     fi
}

USAGE(){
    echo -e "$R USAGE: $N sudo sh fie-name package1 package2 ....."
    exit 1
}

CHECK_ROOT

if [ $# -eq 0 ]
then 
    USAGE 
fi

for package in $@
do
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]
  then
     echo "$package is not installed,going to install it.."  &>>$LOG_FILE
     dnf install $package -y &>>$LOG_FILE
     VALIDATE $? "INSTALLING $package"
  else
     echo "$package is already $Y installed...nothing to do $N" &>>$LOG_FILE
  fi
done
