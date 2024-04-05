#!/bin/bash
set -euo pipefail

delete_vols() {
    vols=$(aws ec2 describe-volumes --region us-east-1 | jq -r '.Volumes[].VolumeId')
    for vol in $vols; do
        status=$(aws ec2 describe-volumes --volume-ids "$vol" | jq -r ".Volumes[].Attachments[].State")
        if [[ "$status" == 'attached' ]]; then
            echo "Volume $vol is attached to an instance. Skipping deletion."
        else
            echo "Deleting volume $vol as it's not in use"
            aws ec2 delete-volume --volume-id "$vol"
        fi
    done
}

delete_vols

# delete unattached volumes
