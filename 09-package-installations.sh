#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then 
    echo "Please run the script with root previleges"
    exit 1
fi

dnf list installed git 

if [ $? ne 0 ]
then
    echo "git is not installed... goint to install the git"

    dnf install git -y
    if [ $? ne 0]
    then 
        echo "git installation is not SUCCESS...Please check it"
    else
        echo "git installed SUCCESSFULLY"
    fi
else
    echo "git is already installed...nothing to do"
fi 


dnf list installed mysql

if [ $? ne 0 ]
then 
    echo "mysql is not installed...going to install the mysql"
    dnf install mysql -y
    if [ $? ne 0 ]
    then
        echo "mysql installation is not success..please check it once"
    else
        echo "mysql installed SUCCESSFULLY"
    fi
else
    echo "mysql is installed already...nothing to do"
fi 