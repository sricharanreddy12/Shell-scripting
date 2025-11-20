#! /bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then
   echo "error; Run this script with root access"
   exit 1 # 0ther than 0 are not success, so we need to give 1 to 127
else
   echo "you are running with root access"
fi

dnf install Mysql -y

if [$? -eq 0]
then
    echo "Installing Mysql is success"
else
    echo "Installing Mysql is failure"
    exit 1
fi
  