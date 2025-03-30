#!/bin/bash

echo "Please enter your username and password"

read USERNAME  #Asks input form us by interrupting scipt step by step slow
                
read -s PASSWORD #for confidentiality we can use -s to hide the details that we enter

echo "entered username is: $USERNAME"
