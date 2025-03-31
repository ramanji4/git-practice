#!/bin/bash

NUMBER1=$1

if [ $NUMBER1 -gt 20 ]
then
    echo "given num : $NUMBER1 is greater than 20"
else
    echo "given num : $NUMBER1 is less than 20"
fi 