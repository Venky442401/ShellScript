#!/bin/bash
Validate(){
    if[ $1 -ne 0 ]
    then 
        echo "installation failed"
    else
        echo "Installed successfully"
    fi
}
if [ $UID -ne 0 ]
then 
    echo "please run with root user"
else
    echo "root user"
fi

dnf install nginx -y
if [ $? -ne 0 ]
then 
    echo "nginx installation failed"
else
    echo "Installed successfully"
fi
Validate $?,"nginx"
#systemctl enable nginx
#systemctl start nginx