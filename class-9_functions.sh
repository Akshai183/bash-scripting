#!/bin/bash
set -x
delete_vols() {
    vols=$(aws ec2 describe-volumes --region us-east-1 | jq '.Volumes[].VolumeId' | tr -d '"')
    for vol in $vols; do
        status=$(aws ec2 describe-volumes --volume-ids $vol | jq ".Volumes[].Attachments[].State" | tr -d '"')
        if [[ "${STATUS}" == 'attached' ]]; then
            echo "Volume $vol is attached to an instance. Skipping deletion."
        else
            echo "Deleting volume $vol as its not in use"
            aws delete-volume --volume-id $vol
        fi
        aws delete-volume --volume-id $vol
    done
}

# delete unattached volumes
