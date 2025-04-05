#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
O="\e[38;5;130m"

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
        echo -e " $G $2 is installed already...nothing to do $N"
    else
        echo -e "$O $2 is not installed...going to install $2 $N"
    fi 
}

STATUS_VALIDATION(){
    if [ $1 -eq 0 ]
    then
        echo -e " $G $2 is installed SUCCESSFULLY $N"
    else
        echo -e "$R $2 installation is FAILURE...Please check it $N"
        exit 1
    fi
}

ROOT_ACCESS 


dnf list installed git 

CHECK_VALIDATION $? "git"

dnf install git -y

STATUS_VALIDATION $? "git"




dnf list installed nginx

CHECK_VALIDATION $? "nginx"

dnf install nginx -y

STATUS_VALIDATION $? "nginx"



dnf list installed mysql

CHECK_VALIDATION $? "mysql"

dnf install mysql -y

STATUS_VALIDATION $? "mysql"