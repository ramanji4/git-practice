#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

ROOT_ACCESS(){
    if [ $USERID -eq 0 ]
    then
        echo "Running the scripts with root Priveleges"
    else
        echo "PLEASE RUN THE SCRIPT WITH ROOT PRIVELEGES"
        exit 1
    fi
} 

VALIDATION(){
    if [ $1 -eq 0 ]
    then
        echo "$2 is installed already...nothing to do"
    else
        echo "$2 is not installed...going to install $2"
    fi
}

ROOT_ACCESS 

dnf list installed git 

VALIDATION $? "Git"
