#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

Validate(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 installation failed"
        exit 1
    else
        echo "$2 Installed successfully"
    fi
}
if [ $UID -ne 0 ]
then 
    echo "please run with root user"
    exit 1
else
    echo "root user"
fi

dnf install nginx -y
Validate $? "nginx"
systemctl enable nginx
Validate $? "nginx enable"
systemctl start nginx
Validate $? "nginx started"
rm -rf /usr/share/nginx/html/*
Validate $? "remove defaullt web data"
curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip
Validate $? "download web application"
cd /usr/share/nginx/html
Validate $? "change dirctory"
unzip -o /tmp/web.zip
Validate $? "unzip"
#cp /home/centos/roboshop-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf
