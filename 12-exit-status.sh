#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

ROOT_ACCESS(){
    if [ $USERID -eq 0 ]
    then
        echo -e "$G RUNNING THE SCRIPT WITH ROOT PREVILEGES $N"
    else
        echo -e "$R PLEASE RUN THE SCRIPT WITH ROOT PRIVELEGES $N"
        exit 1
    fi
} 

CHECK_VALIDATION(){
    if [ $1 -eq 0 ]
    then
        echo "$2 is installed already...nothing to do"
    else
        echo "$2 is not installed...going to install $2"
    fi 
}

STATUS_VALIDATION(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is installed $G SUCCESSFULLY $N"
    else
        echo -e "$R $2 installation is FAILURE...Please check it $N"
        exit 1
    fi
}

ROOT_ACCESS 


dnf list installed git 

CHECK_VALIDATION $? "Git"

dnf install git -y

STATUS_VALIDATION $? "Git"




dnf list installed nginx

VALIDATION $? "nginx"

dnf install nginx -y

VALIDATION_2 $? "nginx"