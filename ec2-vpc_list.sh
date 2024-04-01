#!/bin/bash
if [ $# -gt 0 ];then
   for REGION in $@; do
       dogsay "########### {$REGION} ###########"
      aws ec2 describe-vpcs --region $REGION | jq '.Vpcs[].VpcId' -r
   done
else
echo "You have not given any $# parameters to this script"
fi
