#!/bin/bash

USERID=(id -u)

N="\e[0m"
R="\e[31m"
G="\e[32m"

ROOT_ACCESS(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run the script with root preveleges"
        exit 1
    fi
}

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 installation is $R FAILED $N"
    else
        echo "$2 is installed $G SUCCESSFULLY $N"
    fi
}
s
ROOT_ACCESS

dnf list installed git 

if [ $? -ne 0 ]
then 
    echo "git is not installed...going to install" 
    dnf install git -y 
    VALIDATION $? "git"
fi 


dnf list installed mysql 
if [ $? -ne 0 ]
then
    echo "mysql is not installed...going to install mysql"
    dnf install mysql -y
    VALIDATION $? "mySQL"
fi 