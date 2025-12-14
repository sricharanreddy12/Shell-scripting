#! /bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m" #"\e[0m" ---also used for white 

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "$R Error :: Run with root user to exceute script $N"
    exit 1 #other than 0, from 1 t0 127 are not sucees code
else
    echo -e "$G Already running with root user $N"
fi
# validate function  takes input as exit status, what command they tried to install
VALIDATE(){
if [ $1 -e 0 ]
then
    echo -e "$G installing $2 is ..success $N"
else 
    echo -e "$R installing $2 is failure $N"
    exit 1
 fi   
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo -e "Mysql is not installed... $G going to install $N"
    dnf install mysql -y
    VALIDATE $? "Mysql"
else
    echo -e " $Y Mysql was already installed nothing to do $N"
fi
dnf list installed python3
if [ $? -ne 0 ]
then
    echo -e " $R Python3 is not installed...going to install $N"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "$Y python3 was already installed $N"

fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e "$R Nginx is not installed... going to install $N"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$Y Nginx was already installed"
fi
