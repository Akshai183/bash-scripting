#!/bin/bash
SERVER_NAME=$(curl -sL http://169.254.169.254/latest/meta-data/local-hostname)
Total_Memory=$(free -m | grep -i mem | awk -F " " '{print $2}')
Total_Available_Memory=$(free -m | grep -i mem | awk -F " " '{print $7}')
USED_Memory=$(expr $Total_Memory - $Total_Available_Memory)
echo "Total Memory is ${Total_Memory}MB currently used memory is ${USED_Memory}MB"
FREE_Memory_IN_Percentage=$(expr $Total_Available_Memory \* 100 / $Total_Memory)
echo "Free Memory in % is ${FREE_Memory_IN_Percentage}%"
Current_Memory_Usage=$(expr $USED_Memory \* 100 / $Total_Memory)
if  [ $Current_Memory_Usage -ge 50 ] ;then
    echo "Memory usage is more than 90 %"
    curl -X POST -H 'Content-type: application/json' --data '{"text":"ip-10-37-32-164.ec2.internal Memory usage is more than 90%"}' https://hooks.slack.com/services/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
else
    echo "Memory usage is ${Current_Memory_Usage}% normal"
fi
