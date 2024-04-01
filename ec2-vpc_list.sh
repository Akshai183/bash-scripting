#!/bin/bash
if [ $# -gt 0 ]
then
aws ec2 describe-vpcs --region $# | jq '.Vpcs[].VpcId' -r
else
echo "You have not given any $# parameters to this script"
fi
