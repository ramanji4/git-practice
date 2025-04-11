#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5

R="\e[31m"
N="\e[0m"


while IFS= read -r line
do
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    DISK_PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo -e "$DISK_PARTITION is more than $DISK_THRESHOLD, Current value: $USAGE. $R Please check $N"
    fi
done <<< $DISK_USAGE