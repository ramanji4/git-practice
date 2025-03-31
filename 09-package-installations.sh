#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then 
    echo "Please run the script with root previlages"
    exit 1
if

dnf list installed git 

if [ $? ne 0 ]
then
    echo "git is not installed... goint to install the git"
    exit 1

    dnf install git -y
    if [ $? ne 0]
    then 
        echo "git installation is not SUCCESS...Please check it"
    else
        echo "git installed SUCCESSFULLY"
    fi
else
    echo "git is already installed...nothing to do"