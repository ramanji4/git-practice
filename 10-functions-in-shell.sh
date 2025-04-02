#!/bin/bash

USERDID=$(id -u)

ROOT_ACCESS(){
    if [ $USERDID -ne 0 ]
    then 
        echo "Please run the script with root priveleges"
        exit 1
    fi
}

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 installation is FAILURE...Please check it once"
        exit 1
    else
        echo "$2 is installed SUCCESSFULLY..."
    fi
}

ROOT_ACCESS

dnf list installed git

if [ $? -ne 0 ]
then 
    echo "git is not installed...going to install the git"
    dnf install git -y
    VALIDATION $? "git"
else
    echo "git is already installed...nothing to do"
fi 

dnf list installed mysql 

if [ $? -ne 0 ]
then
    echo "mysql is not installed...gong to install the mysql"
    dnf install mysql -y 
    VALIDATION $? "mySQL"
else
    echo "mySQL is already installed...nothing to do"
fi 