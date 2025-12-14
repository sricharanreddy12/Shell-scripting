#! /bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error :: Run with root user to exceute script"
    exit 1 #other than 0, from 1 t0 127 are not sucees code
else
    echo "Already running with root user"
fi
# validate function  takes input as exit status, what command they tried to install
VALIDATE(){
if [ $1 -eq 0 ]
then
    echo "installing $2 is ..success"
else 
    echo "installing $2 is failure"
    exit 1
 fi   
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Mysql is not installed... going to install"
    dnf install mysql -y
    VALIDATE $? "Mysql"
else
    echo " Mysql is already installed nothing to do"
fi
dnf list installed python3
if [ $? -ne 0 ]
then
    echo "Python3 is not installed...going to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 was already installed"

fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "Nginx is not installed... going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "Nginx was already installed"
fi
