#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2

DAYS=${3:-14} #if $3 is empty , default is 14days

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


USAGE(){

    echo -e "$R USAGE: $N sh filename.sh <source> <destination> <days(optional)>"
}

#check the source and destination are provided



if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then 
    echo "$SOURCE_DIR does not exist...Please check"
fi

if [ ! -d $DESTINATION_DIR ]
then 
    echo "$DESTINATION_DIR does not exist...Please check"
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

if [ ! -z $FILES ] #true if FILES is empty , ! makes it expresiion false
then
    echo "Files are found"
else
    echo "No files are older than $DAYS"
fi



