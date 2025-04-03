#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

ROOT_ACCESS(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R PLEASE RUN THE SCRIPT WITH ROOT PRIVELEGES $N"
        exit 1
    fi
}

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 installation is $R FAILED $N"
        exit 1
    else
        echo -e "$2 is installed $G SUCCESSFULLY $N"
    fi
}

ROOT_ACCESS

dnf list installed git 

if [ $? -ne 0 ]
then 
    echo "git is not installed...going to install" 
    dnf install git -y 
    VALIDATION $? "git"
else
    echo "git is already installed... nothing to do..."
fi 


dnf list installed mysql 

if [ $? -ne 0 ]
then
    echo "mysql is not installed...going to install mysql"
    dnf install mysql -y
    VALIDATION $? "mySQL"
else
    echo "mysql is already installed...nothing to do..."
fi 