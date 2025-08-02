#!/bin/bash

SOURCE_DIR="/tmp/shell-logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R Source directory: $SOURCE_DIR does not exist. $N"
fi 

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +2 -name "*.log")

while IFS= read -r line
do 
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES_TO_DELETE