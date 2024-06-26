#!/bin/bash
#set -x
SLACK_WEB='https://hooks.slack.com/services/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'
#USERNAME=$1
if [ $# -gt 0 ]; then
    for USERNAME in $@; do
        if [[ $USERNAME =~ ^[a-z0-9]+$ ]]; then
            EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USERNAME} | cut -d ':' -f 1)
            if [ "${USERNAME}" = "${EXISTING_USER}" ]; then
                echo "The User ${USERNAME} Already Exists. Try A Diffrent Username."
            else
                echo "Lets Create User ${USERNAME}."
                sudo useradd -m $USERNAME --shell /bin/bash -d /home/${USERNAME}
                sudo usermod -aG sudo ${USERNAME}
                echo '${USERNAME} ALL=(ALL) NOPASSWD: ALL' >>/etc/sudoers
                SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
                PASSWORD="India@${RANDOM}${SPEC}"
                echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
                passwd -e ${USERNAME}
                echo "The Temporary Credentails are ${USERNAME} and ${PASSWORD}"
                curl -X POST ${SLACK_WEB} -sL -H 'Content-type: application/json' --data "{"text": \"Username is: ${USERNAME}\"}" >>/dev/null
                curl -X POST ${SLACK_WEB} -sL -H 'Content-type: application/json' --data "{"text": \"Temporary Password Is: ${PASSWORD}  Reset This Password Immediatly.\"}" >>/dev/null

            fi
        else
            echo "The Username ${USERNAME} is Invalid. Please Provide A Valid Username."
        fi
    done
else
    echo "You Have Given $# Arguments. Please Provide Atleast One Arg."
fi
