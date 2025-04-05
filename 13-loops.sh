#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

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
        echo -e "$R $2 installation is FAILED...Please check it $N"
        exit 1
    else
        echo -e"$G $2 installation is SUCCESS $N"
    fi
}

ROOT_ACCESS

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo -e "$Y $package is not installed...going to install it $N"
        dnf install $package
        VALIDATION $? "$package"
    else
        echo -e "$G $package is already installed...nothing to do $N"
    fi
done