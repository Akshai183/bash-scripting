#!/bin/bash
SLACK-WEB='https://hooks.slack.com/services/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'
USERNAME=$1
if [ $# -gt 0 ]; then
    EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USERNAME} | cut -d ':' -f 1)
    if [ "${USERNAME}" == "${EXISTING_USER}" ]; then
        echo "User ${USERNAME} already exists."
    else
        echo "Lets Create User ${USERNAME}."
        sudo useradd -m $USERNAME --shell /bin/bash -d /home/${USERNAME}
        sudo usermod -a -G root $USERNAME
        SPEC=$(echo '!@#$%^&*()_' | fols -w1 | shuf | tail -1)
        PASSWORD="India@${RANDOM}${SPEC}" 
        echo "Password for ${USERNAME} is ${PASSWORD}" | sudo chpasswd
        passwd -e ${USERNAME}
        echo "The temporary credentials are ${USERNAME} and ${PASSWORD"
        curl -X POST ${SLACK-WEB} -sL -H 'Content-type: application/json' --data "{"text": \"Username is: ${USERNAME}.\"}" >> /dev/null
        curl -X POST ${SLACK-WEB} -sL -H 'Content-type: application/json' --data "{"text": \"Temporary-Password is: ${PASSWORD} Reset the password immediately.\"}" >> /dev/null
    fi 
else
    echo "You have not given $# arguments please provide atleast 1 args."
fi