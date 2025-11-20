#! /bin/bash

echo "Listing of the variable : $1"
echo "All variables should be passed to the script: $@"
echo "No.of variables : $#"
echo "Script name: $0"
echo "present working directory: $PWD"
echo "user running the script: $USER"
echo "Home directory of user: $HOME"
echo "success status of the command: $?"
echo "PID of the script: $$"
sleep 10 &
echo " PID of last command moving to background: $!"