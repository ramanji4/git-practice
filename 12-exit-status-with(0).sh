#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

ROOT_ACCESS(){
    if [ $USERID eq 0 ]
    then
        echo "Proceeding with root Priveleges"
    else
        echo "PLEASE RUN THE SCRIPT WITH ROOT PRIVELEGES"
        exit 1
    fi
} 

ROOT_ACCESS 