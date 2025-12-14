#! /bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m" #"\e[0m" ---also used for white 

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executing at $(date)" | tee -a $LOG_FILE

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "$R Error :: Run with root user to exceute script $N" | tee -a $LOG_FILE
    exit 1 #other than 0, from 1 t0 127 are not sucees code
else
    echo -e "$G Already running with root user $N" | tee -a $LOG_FILE
fi
# validate function  takes input as exit status, what command they tried to install
VALIDATE(){
if [ $1 -eq 0 ]
then
    echo -e "installing $2 is $G success $N" | tee -a $LOG_FILE
else 
    echo -e "installing $2 is  $R failure $N" | tee -a $LOG_FILE
    exit 1
 fi   
}

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo -e "Mysql is not installed... $G going to install $N" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "Mysql"
else
    echo -e " $Y Mysql was already installed nothing to do $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e " $R Python3 is not installed...going to install $N" | tee -a $LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "$Y python3 was already installed $N" | tee -a $LOG_FILE

fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "$R Nginx is not installed... going to install $N" | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "$Y Nginx was already installed $N" | tee -a $LOG_FILE
fi
