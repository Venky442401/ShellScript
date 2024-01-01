#!/bin/bash
Validate(){
    if[${1} -eq 0]
}
if [ $UID -ne 0 ]
then 
    echo "please run with root user"
else
    echo "root user"
fi

dnf install nginx -y
if [$? -eq 0]
then 
    echo "Installed successfully"
else
    echo "nginx installation failed"
fi

#systemctl enable nginx
#systemctl start nginx