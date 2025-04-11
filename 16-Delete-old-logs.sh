#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs  #this is the example directory that I created manually

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


if [ -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR is $G Exists $N"
else
    echo -e "$SOURCE_DIR is $R doesn't exists $N"
    exit 1
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

if [ ! -z $FILES ]
then
    echo "files: $FILES"
    while IFS= read -r file    
    do
        echo "Deleting file: $file"
        rm -rf $file
    done <<< $FILES
else
    echo -e "$Y No files found older than 14 days $N"
fi

 #IFS(internal field separator. IFS means empty here... IFS will not ignore white spaces...
 # -r is for not to ignore special charqacters like / or _
 # didn't use line, as line is a reserved word

