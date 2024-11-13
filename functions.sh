#!/bin/bash

userid=$(id -u)

VALIDATE(){
     if [ $1 -ne 0 ]
     then  
         echo "$2 is ... failed"
         exit 1
     else 
         echo "$2 is .... success"
     fi
}

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
    VALIDATE $? "INSTALLING GIT"
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
    VALIDATE $? "INSTALLING MYSQL"
    else
        echo "MYSQL installation is success"
    fi
else
    echo "MYSQL is alraedy installed...nothing to do"
fi