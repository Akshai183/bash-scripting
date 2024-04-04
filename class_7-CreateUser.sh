#!/bin/bash
#set -x
SLACK_WEB='https://hooks.slack.com/services/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'
USERNAME=$1
if [ $# -gt 0 ]; then
    if id "$USERNAME" &>/dev/null; then
        echo "User ${USERNAME} already exists."
    else
        echo "Let's create user ${USERNAME}."
        sudo useradd -m "$USERNAME" --shell /bin/bash -d /home/"${USERNAME}"
        sudo usermod -a -G root "$USERNAME"
        SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | tail -1)
        PASSWORD="India@${RANDOM}${SPEC}" 
        echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
        passwd -e "${USERNAME}"
        echo "The temporary credentials are ${USERNAME} and ${PASSWORD}"
        curl -X POST "${SLACK_WEB}" -sL -H 'Content-type: application/json' --data "{\"text\": \"Username is: ${USERNAME}\"}" >>/dev/null
        curl -X POST "${SLACK_WEB}" -sL -H 'Content-type: application/json' --data "{\"text\": \"Temporary-Password is: ${PASSWORD} Reset the password immediately\"}" >>/dev/null
    fi 
else
    echo "You have not given $# arguments. Please provide at least 1 arg."
fi
