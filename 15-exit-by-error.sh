#!/bin/bash

set -e  # this command is basically can be used same as "exit 1". 
        #This command will help to exit from the running script whenever we interrupt with the error


failure(){
    echo "Failed at: $1:$2"
}

trap 'failure " ${LINENO}" "$BASH_COMMAND"' ERR   #ERR is the error signal 
                                                #trap command will catch the error with "ERR" and then calls failure function

echo "Hello World success"
echooo "Hello World failure" 
echo "Hello World after failure"