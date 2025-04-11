#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}   #if $3 is empty then the default value is 14 days
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m]"

USAGE(){
    echo -e " $R USAGE: $0 <source_dir> <destination_dir> days(optional) $N"
}

if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e " $R $SOURCE_DIR doesn't exists...please check it $N"
    exit 1
fi

if [ ! -d $DESTINATION_DIR ]
then
    echo -e " $R $DESTINATION_DIR doesn't exists...please check it $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
echo "Files: $FILES"

if [ ! -z $FILES ]
then
    echo -e "$G files are found $N"
    ZIP_FILE="$DESTINATION_DIR/app-logs_$TIME_STAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime $DAYS | zip "$ZIP_FILE" -@
    
    if [ -f $ZIP_FILE ]
    then
        echo -e "$G Successfully Zipped the files $N older than $DAYS"
        while IFS= read -r file
        do
            echo "Deleting the file: $file"
            rm -rf
        done <<< $FILES
    else
        echo -e "Zipping the files is $R FAILED $N"
        exit 1
    fi
else
    echo -e "No files found older than $DAYS"
fi