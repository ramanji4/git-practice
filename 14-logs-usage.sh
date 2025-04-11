#!/bin/bash

LOGS_FOLDER="/var/log/shell_scripts"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log

mkdir -p $LOGS_FOLDER 

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[32m"
N="\e[0m"

ROOT_ACCESS(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R PLEASE RUN THE SCRIPT WITH ROOT PRIVELEGES $N"
        exit 1
    fi
}

USAGE(){
    echo -e "$R USAGE : sudo sh $0 package1 package2 package3....$N"
    exit 1
}


VALIDATION(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2 installation is FAILURE...Please check it $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$G $2 installation is SUCCESS $N" | tee -a $LOG_FILE
    fi
}


echo "Script started executing at: $(date)" | tee -a $LOG_FILE

if [ $# -eq 0 ]
then
    USAGE
fi


ROOT_ACCESS

for package in $@
do
    dnf list installed $package &>>$LOG_FILE 
    if [ $? -ne 0 ]
    then
        echo -e "$Y $package is not installed...going to install it $N" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE  
        VALIDATION $? "$package"
    else
        echo -e "$G $package is already installed...nothing to do $N" | tee -a $LOG_FILE
    fi
done