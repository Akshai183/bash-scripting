#!/bin/bash
USERNAME=$1
if [ $# -gt 0 ]; then
   EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USERNAME} | cut -d ':' -f 1)
   if [ "${USERNAME}" == "${EXISTING_USER}" ]; then
    echo "User ${USERNAME} already exists."
    else
        echo "Lets Create User ${USERNAME}."
    fi 
else
echo "You have not given $# arguments please provide atleast 1 args."
fi