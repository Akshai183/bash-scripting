#!/bin/bash
systemctl  status nginx --no-pager > /dev/null
if [ $? -eq 0 ]; then
    echo "Nginx is running"
else
    echo "Nginx is not running lets start it"
    systemctl start nginx > /dev/null
    systemctl  status nginx --no-pager | grep -i running | awk -F " " '{print $1,$3}'
fi