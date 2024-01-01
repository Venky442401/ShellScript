#!/bin/bash
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
